; ModuleID = 'source/fib_baseline.cpp'
source_filename = "source/fib_baseline.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%"class.std::basic_istream" = type { i32 (...)**, i64, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", %"class.std::basic_ostream"*, i8, i8, %"class.std::basic_streambuf"*, %"class.std::ctype"*, %"class.std::num_put"*, %"class.std::num_get"* }
%"class.std::ios_base" = type { i32 (...)**, i64, i64, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"class.std::locale" }
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"class.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i64 }
%"class.std::locale" = type { %"class.std::locale::_Impl"* }
%"class.std::locale::_Impl" = type { i32, %"class.std::locale::facet"**, i64, %"class.std::locale::facet"**, i8** }
%"class.std::locale::facet" = type <{ i32 (...)**, i32, [4 x i8] }>
%"class.std::basic_ostream" = type { i32 (...)**, %"class.std::basic_ios" }
%"class.std::basic_streambuf" = type { i32 (...)**, i8*, i8*, i8*, i8*, i8*, i8*, %"class.std::locale" }
%"class.std::ctype" = type <{ %"class.std::locale::facet.base", [4 x i8], %struct.__locale_struct*, i8, [7 x i8], i32*, i32*, i16*, i8, [256 x i8], [256 x i8], i8, [6 x i8] }>
%"class.std::locale::facet.base" = type <{ i32 (...)**, i32 }>
%struct.__locale_struct = type { [13 x %struct.__locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.__locale_data = type opaque
%"class.std::num_put" = type { %"class.std::locale::facet.base", [4 x i8] }
%"class.std::num_get" = type { %"class.std::locale::facet.base", [4 x i8] }

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external hidden global i8
@_ZSt3cin = external global %"class.std::basic_istream", align 8
@_ZSt4cout = external global %"class.std::basic_ostream", align 8
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_fib_baseline.cpp, i8* null }]

declare void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* noundef nonnull align 1 dereferenceable(1)) unnamed_addr #0

; Function Attrs: nounwind
declare void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"* noundef nonnull align 1 dereferenceable(1)) unnamed_addr #1

; Function Attrs: nofree nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) local_unnamed_addr #2

; Function Attrs: mustprogress norecurse uwtable
define dso_local noundef i32 @main() local_unnamed_addr #3 {
  %1 = alloca i32, align 4
  %2 = bitcast i32* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %2) #7
  %3 = call noundef nonnull align 8 dereferenceable(16) %"class.std::basic_istream"* @_ZNSirsERi(%"class.std::basic_istream"* noundef nonnull align 8 dereferenceable(16) @_ZSt3cin, i32* noundef nonnull align 4 dereferenceable(4) %1)
  %4 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i32 noundef 0)
  %5 = bitcast %"class.std::basic_ostream"* %4 to i8**
  %6 = load i8*, i8** %5, align 8, !tbaa !5
  %7 = getelementptr i8, i8* %6, i64 -24
  %8 = bitcast i8* %7 to i64*
  %9 = load i64, i64* %8, align 8
  %10 = bitcast %"class.std::basic_ostream"* %4 to i8*
  %11 = getelementptr inbounds i8, i8* %10, i64 %9
  %12 = getelementptr inbounds i8, i8* %11, i64 240
  %13 = bitcast i8* %12 to %"class.std::ctype"**
  %14 = load %"class.std::ctype"*, %"class.std::ctype"** %13, align 8, !tbaa !8
  %15 = icmp eq %"class.std::ctype"* %14, null
  br i1 %15, label %16, label %17

16:                                               ; preds = %0
  call void @_ZSt16__throw_bad_castv() #8
  unreachable

17:                                               ; preds = %0
  %18 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %14, i64 0, i32 8
  %19 = load i8, i8* %18, align 8, !tbaa !13
  %20 = icmp eq i8 %19, 0
  br i1 %20, label %24, label %21

21:                                               ; preds = %17
  %22 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %14, i64 0, i32 9, i64 10
  %23 = load i8, i8* %22, align 1, !tbaa !15
  br label %30

24:                                               ; preds = %17
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %14)
  %25 = bitcast %"class.std::ctype"* %14 to i8 (%"class.std::ctype"*, i8)***
  %26 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %25, align 8, !tbaa !5
  %27 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %26, i64 6
  %28 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %27, align 8
  %29 = call noundef signext i8 %28(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %14, i8 noundef signext 10)
  br label %30

30:                                               ; preds = %21, %24
  %31 = phi i8 [ %23, %21 ], [ %29, %24 ]
  %32 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %4, i8 noundef signext %31)
  %33 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %32)
  %34 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i32 noundef 1)
  %35 = bitcast %"class.std::basic_ostream"* %34 to i8**
  %36 = load i8*, i8** %35, align 8, !tbaa !5
  %37 = getelementptr i8, i8* %36, i64 -24
  %38 = bitcast i8* %37 to i64*
  %39 = load i64, i64* %38, align 8
  %40 = bitcast %"class.std::basic_ostream"* %34 to i8*
  %41 = getelementptr inbounds i8, i8* %40, i64 %39
  %42 = getelementptr inbounds i8, i8* %41, i64 240
  %43 = bitcast i8* %42 to %"class.std::ctype"**
  %44 = load %"class.std::ctype"*, %"class.std::ctype"** %43, align 8, !tbaa !8
  %45 = icmp eq %"class.std::ctype"* %44, null
  br i1 %45, label %46, label %47

46:                                               ; preds = %30
  call void @_ZSt16__throw_bad_castv() #8
  unreachable

47:                                               ; preds = %30
  %48 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %44, i64 0, i32 8
  %49 = load i8, i8* %48, align 8, !tbaa !13
  %50 = icmp eq i8 %49, 0
  br i1 %50, label %54, label %51

51:                                               ; preds = %47
  %52 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %44, i64 0, i32 9, i64 10
  %53 = load i8, i8* %52, align 1, !tbaa !15
  br label %60

54:                                               ; preds = %47
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %44)
  %55 = bitcast %"class.std::ctype"* %44 to i8 (%"class.std::ctype"*, i8)***
  %56 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %55, align 8, !tbaa !5
  %57 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %56, i64 6
  %58 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %57, align 8
  %59 = call noundef signext i8 %58(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %44, i8 noundef signext 10)
  br label %60

60:                                               ; preds = %51, %54
  %61 = phi i8 [ %53, %51 ], [ %59, %54 ]
  %62 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %34, i8 noundef signext %61)
  %63 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %62)
  %64 = load i32, i32* %1, align 4, !tbaa !16
  %65 = icmp sgt i32 %64, 1
  br i1 %65, label %66, label %104

66:                                               ; preds = %60, %98
  %67 = phi i32 [ %69, %98 ], [ 0, %60 ]
  %68 = phi i32 [ %71, %98 ], [ 1, %60 ]
  %69 = phi i32 [ %70, %98 ], [ 1, %60 ]
  %70 = add nsw i32 %67, %69
  %71 = add nuw nsw i32 %68, 1
  %72 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i32 noundef %70)
  %73 = bitcast %"class.std::basic_ostream"* %72 to i8**
  %74 = load i8*, i8** %73, align 8, !tbaa !5
  %75 = getelementptr i8, i8* %74, i64 -24
  %76 = bitcast i8* %75 to i64*
  %77 = load i64, i64* %76, align 8
  %78 = getelementptr inbounds %"class.std::basic_ostream", %"class.std::basic_ostream"* %72, i64 0, i32 1, i32 4
  %79 = bitcast %"class.std::basic_streambuf"** %78 to i8*
  %80 = getelementptr inbounds i8, i8* %79, i64 %77
  %81 = bitcast i8* %80 to %"class.std::ctype"**
  %82 = load %"class.std::ctype"*, %"class.std::ctype"** %81, align 8, !tbaa !8
  %83 = icmp eq %"class.std::ctype"* %82, null
  br i1 %83, label %84, label %85

84:                                               ; preds = %66
  call void @_ZSt16__throw_bad_castv() #8
  unreachable

85:                                               ; preds = %66
  %86 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %82, i64 0, i32 8
  %87 = load i8, i8* %86, align 8, !tbaa !13
  %88 = icmp eq i8 %87, 0
  br i1 %88, label %92, label %89

89:                                               ; preds = %85
  %90 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %82, i64 0, i32 9, i64 10
  %91 = load i8, i8* %90, align 1, !tbaa !15
  br label %98

92:                                               ; preds = %85
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %82)
  %93 = bitcast %"class.std::ctype"* %82 to i8 (%"class.std::ctype"*, i8)***
  %94 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %93, align 8, !tbaa !5
  %95 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %94, i64 6
  %96 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %95, align 8
  %97 = call noundef signext i8 %96(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %82, i8 noundef signext 10)
  br label %98

98:                                               ; preds = %89, %92
  %99 = phi i8 [ %91, %89 ], [ %97, %92 ]
  %100 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %72, i8 noundef signext %99)
  %101 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %100)
  %102 = load i32, i32* %1, align 4, !tbaa !16
  %103 = icmp slt i32 %71, %102
  br i1 %103, label %66, label %104, !llvm.loop !18

104:                                              ; preds = %98, %60
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %2) #7
  ret i32 0
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #4

declare noundef nonnull align 8 dereferenceable(16) %"class.std::basic_istream"* @_ZNSirsERi(%"class.std::basic_istream"* noundef nonnull align 8 dereferenceable(16), i32* noundef nonnull align 4 dereferenceable(4)) local_unnamed_addr #0

declare noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8), i32 noundef) local_unnamed_addr #0

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #4

declare noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8), i8 noundef signext) local_unnamed_addr #0

declare noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8)) local_unnamed_addr #0

; Function Attrs: noreturn
declare void @_ZSt16__throw_bad_castv() local_unnamed_addr #5

declare void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570)) local_unnamed_addr #0

; Function Attrs: uwtable
define internal void @_GLOBAL__sub_I_fib_baseline.cpp() #6 section ".text.startup" {
  call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* noundef nonnull align 1 dereferenceable(1) @_ZStL8__ioinit)
  %1 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i64 0, i32 0), i8* nonnull @__dso_handle) #7
  ret void
}

attributes #0 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nounwind }
attributes #3 = { mustprogress norecurse uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #5 = { noreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!5 = !{!6, !6, i64 0}
!6 = !{!"vtable pointer", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{!9, !10, i64 240}
!9 = !{!"_ZTSSt9basic_iosIcSt11char_traitsIcEE", !10, i64 216, !11, i64 224, !12, i64 225, !10, i64 232, !10, i64 240, !10, i64 248, !10, i64 256}
!10 = !{!"any pointer", !11, i64 0}
!11 = !{!"omnipotent char", !7, i64 0}
!12 = !{!"bool", !11, i64 0}
!13 = !{!14, !11, i64 56}
!14 = !{!"_ZTSSt5ctypeIcE", !10, i64 16, !12, i64 24, !10, i64 32, !10, i64 40, !10, i64 48, !11, i64 56, !11, i64 57, !11, i64 313, !11, i64 569}
!15 = !{!11, !11, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !11, i64 0}
!18 = distinct !{!18, !19, !20}
!19 = !{!"llvm.loop.mustprogress"}
!20 = !{!"llvm.loop.unroll.disable"}
