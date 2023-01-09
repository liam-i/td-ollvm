; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -mattr=+zfh -verify-machineinstrs \
; RUN:   -target-abi ilp32f < %s | FileCheck -check-prefix=RV32IZFH %s
; RUN: llc -mtriple=riscv64 -mattr=+zfh -verify-machineinstrs \
; RUN:   -target-abi lp64f < %s | FileCheck -check-prefix=RV64IZFH %s

; TODO: constant pool shouldn't be necessary for RV32IZfh and RV64IZfh
define half @half_imm() nounwind {
; RV32IZFH-LABEL: half_imm:
; RV32IZFH:       # %bb.0:
; RV32IZFH-NEXT:    lui a0, %hi(.LCPI0_0)
; RV32IZFH-NEXT:    flh fa0, %lo(.LCPI0_0)(a0)
; RV32IZFH-NEXT:    ret
;
; RV64IZFH-LABEL: half_imm:
; RV64IZFH:       # %bb.0:
; RV64IZFH-NEXT:    lui a0, %hi(.LCPI0_0)
; RV64IZFH-NEXT:    flh fa0, %lo(.LCPI0_0)(a0)
; RV64IZFH-NEXT:    ret
  ret half 3.0
}

define half @half_imm_op(half %a) nounwind {
; RV32IZFH-LABEL: half_imm_op:
; RV32IZFH:       # %bb.0:
; RV32IZFH-NEXT:    lui a0, %hi(.LCPI1_0)
; RV32IZFH-NEXT:    flh ft0, %lo(.LCPI1_0)(a0)
; RV32IZFH-NEXT:    fadd.h fa0, fa0, ft0
; RV32IZFH-NEXT:    ret
;
; RV64IZFH-LABEL: half_imm_op:
; RV64IZFH:       # %bb.0:
; RV64IZFH-NEXT:    lui a0, %hi(.LCPI1_0)
; RV64IZFH-NEXT:    flh ft0, %lo(.LCPI1_0)(a0)
; RV64IZFH-NEXT:    fadd.h fa0, fa0, ft0
; RV64IZFH-NEXT:    ret
  %1 = fadd half %a, 1.0
  ret half %1
}