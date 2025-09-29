import sys
import json
import argparse
import os

# ==============================================================================
# ast_parser.py (V8 - "Presentation-Ready" Final Version)
#
# - Hides noisy `ImplicitCastExpr` nodes by default for a much cleaner graph.
# - Further simplifies long C++ type names for better readability.
# ==============================================================================

# --- Configuration ---
START_FROM_MAIN = True
# This is the key new feature! Set to True to dramatically simplify the graph.
HIDE_IMPLICIT_CASTS = True 
# ---

node_counter = 0

def get_node_id():
    global node_counter
    res = f'node{node_counter}'
    node_counter += 1
    return res

def get_node_label(node):
    kind = node.get('kind', 'UnknownKind')
    label = kind
    
    name = node.get('name')
    if name:
        label += f"\\n({name})"

    if kind == 'DeclRefExpr':
        ref_name = node.get('referencedDecl', {}).get('name')
        if ref_name:
            label += f"\\n({ref_name})"

    if kind in ['BinaryOperator', 'CompoundAssignOperator', 'CXXOperatorCallExpr']:
        opcode = node.get('opcode') or node.get('referencedDecl', {}).get('name')
        if opcode:
            # Clean up operator names like 'operator<<'
            opcode = opcode.replace('operator', '').strip()
            label += f"\\n({opcode})"
            
    if kind == 'UnaryOperator':
        opcode = node.get('opcode')
        is_postfix = node.get('isPostfix')
        if opcode:
            label += f"\\n({opcode}{' (postfix)' if is_postfix else ''})"
    
    node_type = node.get('type', {}).get('qualType')
    if node_type:
        # Aggressive cleaning of C++ type names
        replacements = {
            'std::basic_ostream<char, std::char_traits<char>>::__ostream_type': 'std::ostream',
            'std::basic_istream<char, std::char_traits<char>>::__istream_type': 'std::istream',
            'std::basic_ostream<char, std::char_traits<char>>': 'std::ostream',
            'std::basic_istream<char, std::char_traits<char>>': 'std::istream',
            'std::': '' # Remove std:: prefix if nothing else matches
        }
        for old, new in replacements.items():
            node_type = node_type.replace(old, new)
        label += f"\\n<{node_type}>"
        
    value = node.get('value')
    if value:
        label += f"\\nvalue: {value}"
        
    return label.replace('"', '\\"')

def traverse_ast(node, parent_id, dot_lines):
    if not node:
        return

    # --- Core new logic: Skip implicit casts ---
    if HIDE_IMPLICIT_CASTS and node.get('kind') == 'ImplicitCastExpr':
        # Don't create a node for the cast, just traverse its children,
        # passing the *current* parent_id down to them.
        if 'inner' in node:
            for child_node in node['inner']:
                traverse_ast(child_node, parent_id, dot_lines)
        return

    current_node_id = get_node_id()
    label = get_node_label(node)
    
    dot_lines.append(f'  {current_node_id} [label="{label}"];')
    
    if parent_id:
        dot_lines.append(f'  {parent_id} -> {current_node_id};')

    if 'inner' in node:
        for child_node in node['inner']:
            traverse_ast(child_node, current_node_id, dot_lines)

def main():
    parser = argparse.ArgumentParser(description="将 Clang JSON AST 转换为 DOT 文件。")
    parser.add_argument("input_file", help="输入的 AST JSON 文件路径")
    parser.add_argument("output_file", help="输出的 DOT 文件路径")
    parser.add_argument("--filter", required=True, help="用于过滤节点的源文件名 (例如 'fib_baseline.cpp')")
    
    args = parser.parse_args()

    try:
        with open(args.input_file, 'r', encoding='utf-8') as f:
            ast_data = json.load(f)
    except FileNotFoundError:
        print(f"错误: 输入文件 '{args.input_file}' 未找到。")
        sys.exit(1)
    except json.JSONDecodeError:
        print(f"错误: 文件 '{args.input_file}' 不是有效的JSON格式。")
        sys.exit(1)
        
    start_node = ast_data
    
    if START_FROM_MAIN and ast_data.get('kind') == 'TranslationUnitDecl':
        source_file_basename = os.path.basename(args.filter)
        main_func_node = None
        for child in ast_data.get('inner', []):
            loc = child.get('loc', {})
            file_path = loc.get('file', '')
            if (child.get('kind') == 'FunctionDecl' and
                child.get('name') == 'main' and
                file_path and source_file_basename in file_path):
                main_func_node = child
                break
        if main_func_node:
            start_node = main_func_node
            print("信息: 找到 main 函数，将其作为根节点。")
        else:
            print("警告: 未找到 main 函数，将使用默认的根节点。")
    
    dot_lines = [
        'digraph AST {',
        '  graph [rankdir="TB"];',
        '  node [shape=box, style="rounded", fontname="Helvetica"];',
        '  edge [fontname="Helvetica"];'
    ]
    
    traverse_ast(start_node, None, dot_lines)
    
    dot_lines.append('}')
    
    with open(args.output_file, 'w', encoding='utf-8') as f:
        f.write('\n'.join(dot_lines))
        
    print(f"成功！已从JSON生成DOT文件: '{args.output_file}'")

if __name__ == '__main__':
    main()