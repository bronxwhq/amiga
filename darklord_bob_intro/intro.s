>EXTERN "includes/logo.bin",$62000
>EXTERN "includes/mod.hard-rider",$35000

mt_data     = $35000
Time        = 60*1 ; bobs changing time
Num         = 160  ; number of bobs

;ннннннннннннннннннннннннннннн DMA registers ннннннннннннннннннннннннннннн----
Custom      = $dff000
Dmaconr     = $002
Vposr       = $004
Vhposr      = $006
Joy0dat     = $00A
Joy1dat     = $00C
Clxdat      = $00E
Adkconr     = $010
Pot0dat     = $012
Pot1dat     = $014
Potcor      = $016
Serdatr     = $018
Dskbytr     = $01A
Intenar     = $01C
Intereqr    = $01E
Dskpth      = $020
Dskptl      = $022
Dsklen      = $024
Dskdat      = $026
Refptr      = $028
Vposw       = $02A
Vhposw      = $02C
Copcon      = $02E
Serdat      = $030
Serper      = $032
Potco       = $034
Joytest     = $036

;ннннннннннннн Blitter registers ---------------------------------------------
Bltcon0     = $040
Bltcon1     = $042
Bltafwm     = $044
Bltalwm     = $046
Bltcpth     = $048
Bltcptl     = $04A
Bltbpth     = $04C
Bltbptl     = $04E
Bltapth     = $050
Bltaptl     = $052
Bltdpth     = $054
Bltdptl     = $056
Bltsize     = $058
Bltcmod     = $060
Bltbmod     = $062
Bltamod     = $064
Bltdmod     = $066
Bltcdat     = $070
Bltbdat     = $072
Bltadat     = $074
Dsksync     = $07E

;ннннннннннннн Copper registers ----------------------------------------------
Cop1lc      = $080
Cop1lch     = $080
Cop1lcl     = $082
Cop2lc      = $084
Cop2lch     = $084
Cop2lcl     = $086
Copjmp1     = $088
Copjmp2     = $08A
Diwstrt     = $08E
Diwstop     = $090
Ddfstrt     = $092
Ddfstop     = $094
Dmacon      = $096
Clxcon      = $098
Intena      = $09A
Intreq      = $09C
Adkcon      = $09E
Bpl1pth     = $0E0
Bpl1ptl     = $0E2
Bpl2pth     = $0E4
Bpl2ptl     = $0E6
Bpl3pth     = $0E8
Bpl3ptl     = $0EA
Bpl4pth     = $0EC
Bpl4ptl     = $0EE
Bpl5pth     = $0F0
Bpl5ptl     = $0F2
Bpl6pth     = $0F4
Bpl6ptl     = $0F6
Bplcon0     = $100
Bplcon1     = $102
Bplcon2     = $104
Bpl1mod     = $108
Bpl2mod     = $10A

;ннннннннннннн Sprite registers ----------------------------------------------
Spr0pth     = $120
Spr0ptl     = $122
Spr1pth     = $124
Spr1ptl     = $126
Spr2pth     = $128
Spr2ptl     = $12A
Spr3pth     = $12C
Spr3ptl     = $12E
Spr4pth     = $130
Spr4ptl     = $132
Spr5pth     = $134
Spr5ptl     = $136
Spr6pth     = $138
Spr6ptl     = $13A
Spr7pth     = $13C
Spr7ptl     = $13E
Spr0pos     = $140
Spr0ctl     = $142
Spr0data    = $144
Spr0datb    = $146
Spr1pos     = $148
Spr1ctl     = $14A
Spr1data    = $14C
Spr1datb    = $14E
Spr2pos     = $150
Spr2ctl     = $152
Spr2data    = $154
Spr2datb    = $156
Spr3pos     = $158
Spr3ctl     = $15A
Spr3data    = $15C
Spr3datb    = $15E
Spr4pos     = $160
Spr4ctl     = $162
Spr4data    = $164
Spr4datb    = $166
Spr5pos     = $168
Spr5ctl     = $16A
Spr5data    = $16C
Spr5datb    = $16E
Spr6pos     = $170
Spr6ctl     = $172
Spr6data    = $174
Spr6datb    = $176
Spr7pos     = $178
Spr7ctl     = $17A
Spr7data    = $17C
Spr7datb    = $17E

;ннннннннннннн Color registers -----------------------------------------------
Color00     = $180
Color01     = $182
Color02     = $184
Color03     = $186
Color04     = $188
Color05     = $18A
Color06     = $18C
Color07     = $18E
Color08     = $190
Color09     = $192
Color10     = $194
Color11     = $196
Color12     = $198
Color13     = $19A
Color14     = $19C
Color15     = $19E
Color16     = $1A0
Color17     = $1A2
Color18     = $1A4
Color19     = $1A6
Color20     = $1A8
Color21     = $1AA
Color22     = $1AC
Color23     = $1AE
Color24     = $1B0
Color25     = $1B2
Color26     = $1B4
Color27     = $1B6
Color28     = $1B8
Color29     = $1BA
Color30     = $1BC
Color31     = $1BE

;ннннннннннннннннннннннннннн Library Offsets ннннннннннннннннннннннннннннн----
Openlib     = -408
;нннннннннннннннннннннннннн Macro Definitions нннннннннннннннннннннннннннн----
Wblit:      macro
            btst #14,2(a6)
            dc.w $66f8 ;...bne.s
endm
;ннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннн----
Wblank:     macro
            move.b Vhposr(a6),d0
            dc.w $66fa ;...bne.s
endm
;ннннннннннннннннннннннннннннннн Main Code ннннннннннннннннннннннннннннннн----

            jmp Start

            org $30000
            load $30000

;нннннннннннннннннннннннннн Set Up System For Me ннннннннннннннннннннннннн----
S:
Start:      bchg.b #1,$bfe001
            movem.l d0-d7/a0-a6,-(a7)
            lea Custom,a6
            move Intenar(a6),OldInt ; store system
            ori #$8000,OldInt
            move Dmaconr(a6),OldDma
            ori #$8000,OldDma
            move Adkconr(a6),OldAdk
            ori #$8000,OldAdk
            move #$7fff,d0
            move d0,Dmacon(a6) ; switch dmas off
            move d0,Intena(a6) ; forbid interrupts
            move d0,Intreq(a6) ; clear intreq
            move d0,Adkcon(a6) ; clear adkcon
            move.l #MyCopper,Cop1lch(a6) ; set up my copper
            move #$0000,Copjmp1(a6) ; switch it on
            move #$83c0,Dmacon(a6) ; cop,bp,disk,blt,blt nasty
            move.l $6c,Lev3Int
            move.l #Framer,$6c
            move #$c020,Intena(a6)
mt_init:    lea mt_data,a0
            move.l a0,a1
            add.l #$3b8,a1
            moveq #$7f,d0
            moveq #0,d1
mt_loop:    move.l d1,d2
            subq.w #1,d0
mt_lop2:    move.b (a1)+,d1
            cmp.b d2,d1
            bgt.s mt_loop
            dbf d0,mt_lop2
            addq.b #1,d2
            lea mt_samplestarts(pc),a1
            asl.l #8,d2
            asl.l #2,d2
            add.l #$43c,d2
            add.l a0,d2
            move.l d2,a2
            moveq #$1e,d0
mt_lop3:    clr.l (a2)
            move.l a2,(a1)+
            moveq #0,d1
            move.w 42(a0),d1
            asl.l #1,d1
            add.l d1,a2
            add.l #$1e,a0
            dbf d0,mt_lop3
            or.b #$2,$bfe001
            move.b #$6,mt_speed
            clr.w $dff0a8
            clr.w $dff0b8
            clr.w $dff0c8
            clr.w $dff0d8
            clr.b mt_songpos
            clr.b mt_counter
            clr.w mt_pattpos
            Wblank
            pea Main(pc)
            rts

;нннннннннннннннннннннннннннн System Variables ннннннннннннннннннннннннннн----
            even
Lev3Int:    dc.l 0
OldDma:     dc.w 0
OldInt:     dc.w 0
OldAdk:     dc.w 0
Gfx_lib:    dc.b "graphics.library",00
            
            even
;нннннннннннннннннннннннннн Give The System Back ннннннннннннннннннннннннн----
End:        bchg.b #1,$bfe001
mt_end:     clr.w $dff0a8
            clr.w $dff0b8
            clr.w $dff0c8
            clr.w $dff0d8
            move.w #$f,$dff096
            move #$0020,Intena(a6)
            move.l Lev3Int,$6c
            move OldDma(pc),Dmacon(a6) ; store old dma
            move OldInt(pc),Intena(a6) ; store old int. enable reg.
            move OldAdk(pc),Adkcon(a6) ; store old adkcon reg.
            move.l $4,a6
            lea Gfx_lib,a1
            jsr Openlib(a6)
            move.l d0,a4
            move.l 38(a4),$dff080
            move #$0000,$dff088
            moveq #0,d0
            movem.l (a7)+,d0-d7/a0-a6
            rts

;ннннннннннннннннннннннннн Main Demo Routine Caller нннннннннннннннннннннн----
Main:       move Timer(pc),d0
            bge.s Demo

ChgFig:     lea Figures,a0
            lea X_Vel1,a1
            move Fignum(pc),d0
            add d0,a0
            cmpi #$ffff,(a0)
            bne.s Change
            move #0,Fignum
            bra.s ChgFig
Change:     move.l (a0)+,(a1)+
            move.l (a0)+,(a1)+
            move.l (a0)+,(a1)+
            move.l (a0)+,(a1)+
            add #16,Fignum
            move #Time,Timer

Demo:       WBlank
            bsr.s Cls
            bsr.s SinCalc
            bsr.s Chg_Scr

LMB:        btst #6,$bfe001
            bne.s Main
            pea End(pc)
            rts
;----ннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннн

;ннннннннннннннннннннн Flip The Screens Accordingly нннннннннннннннннннннн----
Chg_Scr:    eor #$4000,Scr1
            eor #$4000,Scr2
            eor #$4000,[Draw_Scr+2]
            rts

;ннннннннннннннннннннн Clear The Drawing Screen To Draw нннннннннннннннннн----
Cls:        move.l #$01000000,Bltcon0(a6)
            move #00,Bltdmod(a6)
            move.l Draw_Scr(pc),Bltdpth(a6)
            move #[163*64+40],Bltsize(a6)
            rts

;нннннннннннннннннн Calculate Sine Table Positions of Bobs ннннннннннннннн----
; A0 = Sinetable ptr.
; A1 = X-Y Values ptr.
; D0-D7 used

SinCalc:    lea Sinetable,a0
            lea Bob_Buf,a1
            move X_Pt1(pc),d0
            add X_Vel1(pc),d0
            and #4094,d0
            move d0,X_Pt1
            move X_Pt2(pc),d1
            add X_Vel2(pc),d1
            and #4094,d1
            move d1,X_Pt2
            move Y_Pt1(pc),d2
            add Y_Vel1(pc),d2
            and #4094,d2
            move d2,Y_Pt1
            move Y_Pt2(pc),d3
            add Y_Vel2(pc),d3
            and #4094,d3
            move d3,Y_Pt2
            move #[4*Num-4],d7

Calculate:
            move (a0,d2.w),d4       ; get y1-value from sine table
            move (a0,d3.w),d5       ; get y2-value from sine table
            add d4,d5               ; total y-value
            lsr #2,d5               ; divide it by 4
            move (a0,d0.w),d4       ; get x1-value from sine table
            move (a0,d1.w),d6       ; get x2-value from sine table
            add d6,d4               ; total x-value
            lsr #1,d4               ; divide it by 2
            movem d4-d5,(a1,d7.w)   ; d4=x d5=y
            add X_Add1(pc),d0
            and #4094,d0
            add X_Add2(pc),d1
            and #4094,d1
            add Y_Add1(pc),d2
            and #4094,d2
            add Y_Add2(pc),d3
            and #4094,d3
            subq #4,d7
            bpl.s Calculate
            Wblit
            bsr.s Prep

;ннннннннннннн Calculate the Screen Pos of Bobs and Blit Them нннннннннннн----
; A1 = X-Y Values ptr.
; A3 = Drawing Screen
; D0-D4 used
            
            lea Draw_Scr(pc),a3
            move #[4*Num-4],d0
CalcScrnPos:
            moveq #0,d1
            movem (a1,d0.w),d1-d2   ; d1=x d2=y
            move d2,d3
            lsl.l #2,d3
            add.l d3,d2
            add.l d2,d2             ; muls #10
            lsl.l #2,d2
            add.l d2,d2             ; muls #8
            move d1,d4              ; save x-value for future use
            lsr #3,d1               ; divide it by 8
            add d2,d1               ; add y to x-value
            add.l (a3),d1           ; add screen value to total value
            and #$f,d4              ; get the remainder to use for shift value
            ror #4,d4
            move d4,d2
            swap d2
            move d4,d2
            or.l #$0fe20000,d2      ; put the shift value to its place
BlitBob:    move.l d2,Bltcon0(a6)
            move.l #Bob_Data,Bltapth(a6)
            move.l #Mask_Data,Bltbpth(a6)
            move.l d1,Bltcpth(a6)
            move.l d1,Bltdpth(a6)
            move #[7*2*64+2],Bltsize(a6)
            subq #4,d0
            bpl.s CalcScrnPos
            rts

;нннннннннннннннннннн Prepeare Blitter Modulos To Bob нннннннннннннннннннн----
Prep:       move #00,Bltamod(a6)
            move #00,Bltbmod(a6)
            move #36,Bltcmod(a6)
            move #36,Bltdmod(a6)
            rts

;ннннннннннннннннннннннннннн Noise Replay Routine нннннннннннннннннннннннн----
mt_music:
            movem.l    d0-d4/a0-a3/a5-a6,-(a7)
            lea    mt_data,a0
            addq.b    #$1,mt_counter
            move.b    mt_counter,D0
            cmp.b    mt_speed,D0
            blt.s    mt_nonew
            clr.b    mt_counter
            bra    mt_getnew
mt_nonew:
            lea    mt_voice1(pc),a6
            lea    $dff0a0,a5
            bsr    mt_checkcom
            lea    mt_voice2(pc),a6
            lea    $dff0b0,a5
            bsr    mt_checkcom
            lea    mt_voice3(pc),a6
            lea    $dff0c0,a5
            bsr    mt_checkcom
            lea    mt_voice4(pc),a6
            lea    $dff0d0,a5
            bsr    mt_checkcom
            bra    mt_endr
mt_arpeggio:
            moveq    #0,d0
            move.b    mt_counter,d0
            divs    #$3,d0
            swap    d0
            cmp.w    #$0,d0
            beq.s    mt_arp2
            cmp.w    #$2,d0
            beq.s    mt_arp1
            moveq    #0,d0
            move.b    $3(a6),d0
            lsr.b    #4,d0
            bra.s    mt_arp3
mt_arp1:    moveq    #0,d0
            move.b    $3(a6),d0
            and.b    #$f,d0
            bra.s    mt_arp3
mt_arp2:    move.w    $10(a6),d2
            bra.s    mt_arp4
mt_arp3:    asl.w    #1,d0
            moveq    #0,d1
            move.w    $10(a6),d1
            lea    mt_periods(pc),a0
            moveq    #$24,d7
mt_arploop:
            move.w    (a0,d0.w),d2
            cmp.w    (a0),d1
            bge.s    mt_arp4
            addq.l    #2,a0
            dbf    d7,mt_arploop
            rts
mt_arp4:    move.w    d2,$6(a5)
            rts
mt_getnew:
            lea    mt_data,a0
            move.l    a0,a3
            move.l    a0,a2
            add.l    #$c,a3
            add.l    #$3b8,a2
            add.l    #$43c,a0
            moveq    #0,d0
            move.l    d0,d1
            move.b    mt_songpos,d0
            move.b    (a2,d0.w),d1
            asl.l    #8,d1
            asl.l    #2,d1
            add.w    mt_pattpos,d1
            clr.w    mt_dmacon
            lea    $dff0a0,a5
            lea    mt_voice1(pc),a6
            bsr.s    mt_playvoice
            lea    $dff0b0,a5
            lea    mt_voice2(pc),a6
            bsr.s    mt_playvoice
            lea    $dff0c0,a5
            lea    mt_voice3(pc),a6
            bsr.s    mt_playvoice
            lea    $dff0d0,a5
            lea    mt_voice4(pc),a6
            bsr.s    mt_playvoice
            bra    mt_setdma
mt_playvoice:
            move.l    (a0,d1.l),(a6)
            addq.l    #4,d1
            moveq    #0,d2
            move.b    $2(a6),d2
            and.b    #$f0,d2
            lsr.b    #4,d2
            move.b    (a6),d0
            and.b    #$f0,d0
            or.b    d0,d2
            tst.b    d2
            beq.s    mt_setregs
            moveq    #0,d3
            lea    mt_samplestarts(pc),a1
            move.l    d2,d4
            subq.l    #$1,d2
            asl.l    #2,d2
            mulu    #$1e,d4
            move.l    (a1,d2.l),$4(a6)
            move.w    (a3,d4.l),$8(a6)
            move.w    $2(a3,d4.l),$12(a6)
            move.w    $4(a3,d4.l),d3
            tst.w    d3
            beq.s    mt_noloop
            move.l    $4(a6),d2
            asl.w    #1,d3
            add.l    d3,d2
            move.l    d2,$a(a6)
            move.w    $4(a3,d4.l),d0
            add.w    $6(a3,d4.l),d0
            move.w    d0,8(a6)
            move.w    $6(a3,d4.l),$e(a6)
            move.w    $12(a6),$8(a5)
            bra.s    mt_setregs
mt_noloop:
            move.l    $4(a6),d2
            add.l    d3,d2
            move.l    d2,$a(a6)
            move.w    $6(a3,d4.l),$e(a6)
            move.w    $12(a6),$8(a5)
mt_setregs:
            move.w    (a6),d0
            and.w    #$fff,d0
            beq    mt_checkcom2
            move.b    $2(a6),d0
            and.b    #$F,d0
            cmp.b    #$3,d0
            bne.s    mt_setperiod
            bsr    mt_setmyport
            bra    mt_checkcom2
mt_setperiod:
            move.w    (a6),$10(a6)
            and.w    #$fff,$10(a6)
            move.w    $14(a6),d0
            move.w    d0,$dff096
            clr.b    $1b(a6)
            move.l    $4(a6),(a5)
            move.w    $8(a6),$4(a5)
            move.w    $10(a6),d0
            and.w    #$fff,d0
            move.w    d0,$6(a5)
            move.w    $14(a6),d0
            or.w    d0,mt_dmacon
            bra    mt_checkcom2
mt_setdma:
            move.w    #$12c,d0
mt_wait:    dbf    d0,mt_wait
            move.w    mt_dmacon,d0
            or.w    #$8000,d0
            move.w    d0,$dff096
            move.w    #$12c,d0
mt_wai2:    dbf    d0,mt_wai2
            lea    $dff000,a5
            lea    mt_voice4(pc),a6
            move.l    $a(a6),$d0(a5)
            move.w    $e(a6),$d4(a5)
            lea    mt_voice3(pc),a6
            move.l    $a(a6),$c0(a5)
            move.w    $e(a6),$c4(a5)
            lea    mt_voice2(pc),a6
            move.l    $a(a6),$b0(a5)
            move.w    $e(a6),$b4(a5)
            lea    mt_voice1(pc),a6
            move.l    $a(a6),$a0(a5)
            move.w    $e(a6),$a4(a5)
            add.w    #$10,mt_pattpos
            cmp.w    #$400,mt_pattpos
            bne.s    mt_endr
mt_nex:     clr.w    mt_pattpos
            clr.b    mt_break
            addq.b    #1,mt_songpos
            and.b    #$7f,mt_songpos
            move.b    mt_songpos,d1
            cmp.b    mt_data+$3b6,d1
            bne.s    mt_endr
            move.b    mt_data+$3b7,mt_songpos
mt_endr:    tst.b    mt_break
            bne.s    mt_nex
            movem.l    (a7)+,d0-d4/a0-a3/a5-a6
            rts
mt_setmyport:
            move.w    (a6),d2
            and.w    #$fff,d2
            move.w    d2,$18(a6)
            move.w    $10(a6),d0
            clr.b    $16(a6)
            cmp.w    d0,d2
            beq.s    mt_clrport
            bge.s    mt_rt
            move.b    #$1,$16(a6)
            rts
mt_clrport:
            clr.w    $18(a6)
mt_rt:      rts
mt_myport:
            move.b    $3(a6),d0
            beq.s    mt_myslide
            move.b    d0,$17(a6)
            clr.b    $3(a6)
mt_myslide:
            tst.w    $18(a6)
            beq.s    mt_rt
            moveq    #0,d0
            move.b    $17(a6),d0
            tst.b    $16(a6)
            bne.s    mt_mysub
            add.w    d0,$10(a6)
            move.w    $18(a6),d0
            cmp.w    $10(a6),d0
            bgt.s    mt_myok
            move.w    $18(a6),$10(a6)
            clr.w    $18(a6)
mt_myok:    move.w    $10(a6),$6(a5)
            rts
mt_mysub:
            sub.w    d0,$10(a6)
            move.w    $18(a6),d0
            cmp.w    $10(a6),d0
            blt.s    mt_myok
            move.w    $18(a6),$10(a6)
            clr.w    $18(a6)
            move.w    $10(a6),$6(a5)
            rts
mt_vib:     move.b    $3(a6),d0
            beq.s    mt_vi
            move.b    d0,$1a(a6)
mt_vi:      move.b    $1b(a6),d0
            lea    mt_sin(pc),a4
            lsr.w    #$2,d0
            and.w    #$1f,d0
            moveq    #0,d2
            move.b    (a4,d0.w),d2
            move.b    $1a(a6),d0
            and.w    #$f,d0
            mulu    d0,d2
            lsr.w    #$6,d2
            move.w    $10(a6),d0
            tst.b    $1b(a6)
            bmi.s    mt_vibmin
            add.w    d2,d0
            bra.s    mt_vib2
mt_vibmin:  sub.w    d2,d0
mt_vib2:    move.w    d0,$6(a5)
            move.b    $1a(a6),d0
            lsr.w    #$2,d0
            and.w    #$3c,d0
            add.b    d0,$1b(a6)
            rts
mt_nop:     move.w    $10(a6),$6(a5)
            rts
mt_checkcom:
            move.w    $2(a6),d0
            and.w    #$fff,d0
            beq.s    mt_nop
            move.b    $2(a6),d0
            and.b    #$f,d0
            tst.b    d0
            beq    mt_arpeggio
            cmp.b    #$1,d0
            beq.s    mt_portup
            cmp.b    #$2,d0
            beq    mt_portdown
            cmp.b    #$3,d0
            beq    mt_myport
            cmp.b    #$4,d0
            beq    mt_vib
            move.w    $10(a6),$6(a5)
            cmp.b    #$a,d0
            beq.s    mt_volslide
            rts
mt_volslide:
            moveq    #0,d0
            move.b    $3(a6),d0
            lsr.b    #4,d0
            tst.b    d0
            beq.s    mt_voldown
            add.w    d0,$12(a6)
            cmp.w    #$40,$12(a6)
            bmi.s    mt_vol2
            move.w    #$40,$12(a6)
mt_vol2:    move.w    $12(a6),$8(a5)
            rts
mt_voldown:
            moveq    #0,d0
            move.b    $3(a6),d0
            and.b    #$f,d0
            sub.w    d0,$12(a6)
            bpl.s    mt_vol3
            clr.w    $12(a6)
mt_vol3:    move.w    $12(a6),$8(a5)
            rts
mt_portup:
            moveq    #0,d0
            move.b    $3(a6),d0
            sub.w    d0,$10(a6)
            move.w    $10(a6),d0
            and.w    #$fff,d0
            cmp.w    #$71,d0
            bpl.s    mt_por2
            and.w    #$f000,$10(a6)
            or.w    #$71,$10(a6)
mt_por2:    move.w    $10(a6),d0
            and.w    #$fff,d0
            move.w    d0,$6(a5)
            rts
mt_portdown:
            clr.w    d0
            move.b    $3(a6),d0
            add.w    d0,$10(a6)
            move.w    $10(a6),d0
            and.w    #$fff,d0
            cmp.w    #$358,d0
            bmi.s    mt_por3
            and.w    #$f000,$10(a6)
            or.w    #$358,$10(a6)
mt_por3:    move.w    $10(a6),d0
            and.w    #$fff,d0
            move.w    d0,$6(a5)
            rts
mt_checkcom2:
            move.b    $2(a6),d0
            and.b    #$f,d0
            cmp.b    #$e,d0
            beq.s    mt_setfilt
            cmp.b    #$d,d0
            beq.s    mt_pattbreak
            cmp.b    #$b,d0
            beq.s    mt_posjmp
            cmp.b    #$c,d0
            beq.s    mt_setvol
            cmp.b    #$f,d0
            beq.s    mt_setspeed
            rts
mt_setfilt:
            move.b    $3(a6),d0
            and.b    #$1,d0
            asl.b    #$1,d0
            and.b    #$fd,$bfe001
            or.b    d0,$bfe001
            rts
mt_pattbreak:
            not.b    mt_break
            rts
mt_posjmp:
            move.b    $3(a6),d0
            subq.b    #$1,d0
            move.b    d0,mt_songpos
            not.b    mt_break
            rts
mt_setvol:
            cmp.b    #$40,$3(a6)
            ble.s    mt_vol4
            move.b    #$40,$3(a6)
mt_vol4:    move.b    $3(a6),$8(a5)
            rts
mt_setspeed:
            cmp.b    #$1f,$3(a6)
            ble.s    mt_sets
            move.b    #$1f,$3(a6)
mt_sets:    move.b    $3(a6),d0
            beq.s    mt_rts2
            move.b    d0,mt_speed
            clr.b    mt_counter
mt_rts2:    rts

;ннннннннннннннннннннннннннн Interrupt Routine ннннннннннннннннннннннннннн----
Framer:     movem.l d0-d7/a0-a5,-(a7)
            move #$0020,Intreq(a6)
            subq #1,Timer
Joy:        move Joy1dat(a6),d1
            move d1,d2
            lsr #1,d2
            eor d1,d2
            btst.b #7,$bfe001
            beq.s Forw2
Forw1:      btst #8,d2
            beq.s Back1
            add #2,Y_Vel1
            move #Time,Timer
            bra.s Left1
Back1:      btst #0,d2
            beq.s Left1
            add #2,Y_Vel2
            move #Time,Timer
Left1:      btst #9,d1
            beq.s Right1
            add #2,X_Vel2
            move #Time,Timer
Right1:     btst #1,d1
            beq.s Exit
            add #2,X_Vel1
            move #Time,Timer
            bra.s Exit
Forw2:      move #Time,Timer
            btst #8,d2
            beq.s Back2
            add #2,Y_Add1
            bra.s Left2
Back2:      btst #0,d2
            beq.s Left2
            add #2,Y_Add2
Left2:      btst #9,d1
            beq.s Right2
            add #2,X_Add2
Right2:     btst #1,d1
            beq.s Exit
            add #2,X_Add1
Exit:       bsr.s Scroll
            bsr mt_music
RMB:        btst #10,$16(a6)
            bne.s Out
            move.l #00,X_Vel1
            move.l #00,Y_Vel1
            move.l #00,X_Add1
            move.l #00,Y_Add1
Out:        movem.l (a7)+,d0-d7/a0-a5
            rte

;нннннннннннннннннннннннн MC68000 Scroll Routine ннннннннннннннннннннннннн----
Scroll:     subq #1,Counter
            ble.s Print
            move.l #[5*48+$60000],a0
            moveq #[5*12],d0
Scroly:     move.l (a0),d1
            roxl.l #1,d1
            move.l d1,(a0)
            subq #4,a0
            dbf d0,Scroly
            rts

Print:      move #8,Counter
            addq #1,Harf
Restart:    move.l #Text,a0
            add Harf,a0
            move.b (a0),d0
            cmpi.b #$ff,d0
            bne.s Notend
            move #1,Harf
            bra.s Restart
Notend:     cmpi.b #' ',d0
            bne.s Nospace
Space:      move.l #[Font_Data+78],d0
            bra.s Blitcharacter
Nospace:    sub.b #'a',d0
            ext d0
            lsl #1,d0
            add.l #Font_Data,d0

Blitcharacter:
            move.l #$6002e,a0
            move.l d0,a1
            moveq #[5-1],d0
Put_Character:
            move (a1),d1
            or d1,(a0)
            add.l #80,a1
            add.l #48,a0
            dbf d0,Put_character
            move.l #$60000,a0
            move #[5-1],d0
Delete_Character:
            move #$00,(a0)
            add #48,a0
            dbf d0,Delete_Character
            pea Scroll(pc)
            rts

Counter:    dc.w 8
Harf:       dc.w 0
Text:
            dc.b " this is a scroller ",$ff

            even

;ннннннннннннннннннннннннннннн My Copper List нннннннннннннннннннннннннннн----
MyCopper:
            dc.w $008e,$3881
            dc.w $0090,$22c1
            dc.w $0092,$0038
            dc.w $0094,$00d0
            dc.w $00e0,$0007
            dc.w $00e2
Scr1:       dc.w $0000
            dc.w $00e4,$0007
            dc.w $00e6
Scr2:       dc.w $0000+40
            dc.w $0100,$2200
            dc.w $0102,$0000
            dc.w $0104,$0000
            dc.w $0108,$0000+40        ;Bpl1mod
            dc.w $010a,$0000+40        ;Bpl2mod
            dc.w $180,$002
            dc.w $182,$24f
            dc.w $184,$20c
            dc.w $186,$009

            dc.w $e001,$fffe
            dc.w $0100,$1200
            dc.w $0108,$0008        ;Bpl1mod
            dc.w $00e0,$0006
            dc.w $00e2,$0002
            dc.w $e101,$fffe,$182,$46f
            dc.w $e201,$fffe,$182,$68f
            dc.w $e301,$fffe,$182,$68f
            dc.w $e401,$fffe,$182,$46f
            dc.w $e501,$fffe,$182,$002

            dc.w $ec01,$fffe
            dc.w $0100,$4200
            dc.w $0108,$0000+120        ;Bpl1mod
            dc.w $010a,$0000+120        ;Bpl2mod
            dc.w $00e0,$0006
            dc.w $00e2,$2000
            dc.w $00e4,$0006
            dc.w $00e6,$2028
            dc.w $00e8,$0006
            dc.w $00ea,$2050
            dc.w $00ec,$0006
            dc.w $00ee,$2078

            dc.w $182,$307,$184,$72c,$186,$94d,$188,$a7d,$18a,$c9e,$18c,$dce
            dc.w $18e,$fff,$190,$00f,$192,$555,$194,$444,$196,$433,$198,$333
            dc.w $19a,$00b,$19c,$009,$19e,$005

            dc.w $22ff,$fffe

;ннннннннннннннннннннннннннн Routine Variables ннннннннннннннннннннннннннн----
            even

X_Vel1:     dc.w 80
X_Vel2:     dc.w 18
Y_Vel1:     dc.w 60
Y_Vel2:     dc.w 08
X_Add1:     dc.w 28
X_Add2:     dc.w 12
Y_Add1:     dc.w 28
Y_Add2:     dc.w 20
X_Pt1:      dc.w 0
X_Pt2:      dc.w 0
Y_Pt1:      dc.w 0
Y_Pt2:      dc.w 0
Bob_Buf:    ds.l Num
Draw_Scr:   dc.l $74000
Figures:    dc.w $0026,$0026,$0060,$0054,$002a,$0036,$0046,$0028
            dc.w $0050,$0012,$003c,$0008,$0096,$004e,$0072,$0024
            dc.w $0050,$0012,$003c,$0008,$015a,$015c,$02b2,$0160
            dc.w $0050,$0012,$003c,$0008,$007c,$0004,$007e,$007e
            dc.w $0050,$0012,$003c,$0008,$01e0,$02d8,$02d6,$01d6
            dc.w $0050,$0012,$003c,$0008,$001c,$0806,$041e,$0408
            dc.w $0050,$0012,$003c,$0008,$0204,$0400,$04f8,$0202
            dc.w $0050,$0012,$003c,$0008,$0674,$0382,$0384,$0676
            dc.w $0050,$0012,$003c,$0008,$001c,$000c,$001c,$0014
            dc.w $0050,$0012,$003c,$0008,$0206,$05f4,$05ee,$0202
            dc.w $0050,$0012,$003c,$0008,$0042,$0042,$0042,$0040
            dc.w $0050,$0012,$003c,$0008,$03fc,$0600,$0812,$020e
            dc.w $0050,$0012,$003c,$0008,$0062,$0042,$0042,$0042
            dc.w $0050,$0012,$003c,$0008,$05cc,$0606,$0820,$0218
            dc.w $0050,$0012,$003c,$0008,$0040,$0042,$0042,$0008
            dc.w $0050,$0012,$003c,$0008,$05cc,$0606,$0820,$03f4
            dc.w $0050,$0012,$003c,$0008,$0042,$003c,$0040,$003e
            dc.w $0050,$0012,$003c,$0008,$0029,$002a,$002a,$002a
            dc.w $0050,$0012,$003c,$0008,$05cc,$0644,$0820,$042c
            dc.w $0050,$0012,$003c,$0008,$0046,$0047,$0047,$0048
            dc.w $0050,$0012,$003c,$0008,$0906,$06ee,$0bda,$0426
            dc.w $0050,$0012,$003c,$0008,$002a,$0fca,$0818,$07be
            dc.w $0050,$0012,$003c,$0008,$01ec,$0202,$0200,$01e4
            dc.w $ffff
Timer:      dc.w Time
Fignum:     dc.w 0

            even

;ннннннннннннннннннннннннн Noise Replay Variables нннннннннннннннннннннннн----
mt_sin:
            dc.b $00,$18,$31,$4a,$61,$78,$8d,$a1,$b4,$c5,$d4,$e0,$eb,$f4
            dc.b $fa,$fd,$ff,$fd,$fa,$f4,$eb,$e0,$d4,$c5,$b4,$a1,$8d,$78
            dc.b $61,$4a,$31,$18

mt_periods:
            dc.w $0358,$0328,$02fa,$02d0,$02a6,$0280,$025c,$023a,$021a,$01fc
            dc.w $01e0,$01c5,$01ac,$0194,$017d,$0168,$0153,$0140,$012e,$011d
            dc.w $010d,$00fe,$00f0,$00e2,$00d6,$00ca,$00be,$00b4,$00aa,$00a0
            dc.w $0097,$008f,$0087,$007f,$0078,$0071,$0000,$0000

mt_speed:   dc.b 1
mt_songpos: dc.b 0
mt_pattpos: dc.w 0
mt_counter: dc.b 0
mt_break:   dc.b 0
mt_dmacon:  dc.w 0
mt_samplestarts:
            ds.l $1f
mt_voice1:
            ds.w 10
            dc.w 1
            ds.w 3
mt_voice2:
            ds.w 10
            dc.w 2
            ds.w 3
mt_voice3:
            ds.w 10
            dc.w 4
            ds.w 3
mt_voice4:
            ds.w 10
            dc.w 8
            ds.w 3

            even

;ннннннннннннннннннннннннннннн Bob Data нннннннннннннннннннннннннннннннннн----
Bob_Data:   incbin "includes/bob1.data"
Mask_Data:  incbin "includes/bob1.mask"
Font_Data:  dc.l $003C007C,$003C007C,$007E007E,$007E0042,$001C000E,$00420040
            dc.l $00420042,$003C007C,$003C007C,$003E003E,$00420042,$00420042
            dc.l $0042007E,$003C0018,$003C007C,$0004007E,$007E007E,$003C007E
            dc.l $00000000,$00300000,$00420042,$00420042,$00400040,$00400042
            dc.l $00080004,$004C0040,$00660062,$00420042,$00420042,$00400008
            dc.l $00420024,$00420024,$00420004,$00460008,$00420002,$001C0040
            dc.l $00400004,$00420042,$00000000,$00300000,$0042007C,$00400042
            dc.l $007C007C,$004E007E,$00080004,$00780040,$005A005A,$00420042
            dc.l $004A0042,$003C0008,$00420024,$005A0018,$003E0018,$005A0008
            dc.l $000C001C,$0024003C,$007E0008,$003C007E,$003C0000,$00300000
            dc.l $007E0042,$00420042,$00400040,$00420042,$00080014,$00440040
            dc.l $00420046,$0042007C,$0046007C,$00020008,$00420018,$00660024
            dc.l $00020020,$00620008,$00300002,$007E0002,$00420010,$00420002
            dc.l $00000030,$00000000,$0042007C,$003C007C,$007E0040,$007E0042
            dc.l $001C001C,$0042007E,$00420042,$003C0040,$003E0042,$007C0008
            dc.l $003C0018,$00420042,$007E007E,$003C003E,$007E007C,$0004007C
            dc.l $007E0020,$003C007E,$00000030,$00300000,$00C07F08,$00000268

;нннннннннннннннннннннннннннн Sine Tables нннннннннннннннннннннннннннннннн----
Sinetable:
            incbin "includes/X_Sine.dat"
;ннннннннннннннннннннннннннннн Thats All Folks ннннннннннннннннннннннннннн
