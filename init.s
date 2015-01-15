; STARTUP-SOURCE BY GHOST V1.0    (AXXXX compitable)

; Any Amiga (500/1200) OCS/ECS compatible 
; compile:
; use ASM1/TrashEM1 or any ASM compiler
; assemble with `a`
; > jo
; little refactoring by vigo/bronx
; Jan 15, 2015
; @vigobronx | @_BRONX_
; http://bronxwhq.org
; info@bronxwhq.org
;
;
;-----------------------------------------------------------------------------
                    screen_length = 40*200

                    dmaconr       = $dff002
                    bltcon0       = $dff040
                    bltcon1       = $dff042
                    bltafwm       = $dff044
                    bltalwm       = $dff046
                    bltaptr       = $dff050
                    bltdptr       = $dff054
                    bltbptr       = $dff04c
                    bltcptr       = $dff048
                    bltsize       = $dff058
                    bltamod       = $dff064
                    bltdmod       = $dff066
                    bltbmod       = $dff062
                    bltcmod       = $dff060
;-----------------------------------------------------------------------------


;-----------------------------------------------------------------------------
                    section startup,code
;-----------------------------------------------------------------------------
o:                  movem.l d0-d7/a0-a6,-(a7)
                    move.l 4,a6
                    jsr -132(a6)
                    lea $dff000,a5
                    bsr.s start_copper

main_loop:          cmp.b #0,$dff006
                    bne.s main_loop

                    bsr flip_flop

wait_left_click:    btst #6,$bfe001
                    bne.s main_loop

                    bsr.s stop_copper
                    move.l 4,a6
                    jsr -138(a6)
                    movem.l (a7)+,d0-d7/a0-a6
                    moveq #0,d0
                    rts

start_copper:       move.l #mouse_sprite,d7
                    move.w d7,mouse_pointer+6
                    swap d7
                    move.w d7,mouse_pointer+2
                    move.l 4,a6

                    lea gfx_library,a1
                    jsr -408(a6)
                    move.l d0,a6
                    move.l d0,gfx_base_pointer
                    move.l 50(a6),old_copper
                    move.l #new_copper,50(a6)
                    rts

stop_copper:        move.l gfx_base_pointer,a6
                    move.l old_copper,50(a6)
                    rts

flip_flop:          cmp.l #screen1,nonactive
                    bne flop

flip:               move.l #screen2,nonactive
                    lea flip_screen,a0
                    lea bitplane_upper,a1
                    move.w #7,d1 ;5*2-1
.loop:              move.w (a0)+,2(a1)
                    lea 4(a1),a1
                    dbf d1,.loop
                    rts

flop:               move.l #screen1,nonactive
                    lea flop_screen,a0
                    lea bitplane_upper,a1
                    move.w #7,d1
.loop:              move.w (a0)+,2(a1)
                    lea 4(a1),a1
                    dbf d1,.loop
                    rts
;-----------------------------------------------------------------------------

;-----------------------------------------------------------------------------
                    section public_datas,data
;-----------------------------------------------------------------------------
gfx_library:        dc.b 'graphics.library',0,0
gfx_base_pointer:   dc.l 0

old_copper:         dc.l 0
nonactive:          dc.l screen2
flip_screen:        dc.l screen1+[screen_length*0]
                    dc.l screen1+[screen_length*1]
                    dc.l screen1+[screen_length*2]
                    dc.l screen1+[screen_length*3]

flop_screen:        dc.l screen2+[screen_length*0]
                    dc.l screen2+[screen_length*1]
                    dc.l screen2+[screen_length*2]
                    dc.l screen2+[screen_length*3]
;-----------------------------------------------------------------------------

;-----------------------------------------------------------------------------
                    section chip_datas,data_c
;-----------------------------------------------------------------------------
new_copper:
copper_list:        dc.w $0100,$0600 ; bit-plane control reg.
                    dc.w $0102,$0000 ; hor-scroll
                    dc.w $0104,$0000 ; $0040 sprite priority
                    dc.w $0106,$1000 ; set color pallette for 16 colors
                    dc.w $0108,$0000 ; 114 modulo (odd)
                    dc.w $010a,$0000 ; modulo (even)
                    dc.w $008e,$2c81 ; screen size
                    dc.w $0090,$2cc1 ; screen size
                    dc.w $0092,$0038 ; h-start
                    dc.w $0094,$00d0 ; h-stop

mouse_pointer:      dc.w $120,0,$122,0

colors_lower:       dc.w $0180,$0,$0182,$0,$0184,$0,$0186,$0 ; plane lower
                    dc.w $0188,$0,$018A,$0,$018C,$0,$018E,$0
                    dc.w $0190,$0,$0192,$0,$0194,$0,$0196,$0
                    dc.w $0198,$0,$019A,$0,$019C,$0,$019E,$0
colors_upper:       dc.w $01a0,$0,$01a2,$0,$01a4,$0,$01a6,$0 ; plane upper
                    dc.w $01a8,$0,$01aA,$0,$01aC,$0,$01aE,$0
                    dc.w $01b0,$0,$01b2,$0,$01b4,$0,$01b6,$0
                    dc.w $01b8,$0,$01bA,$0,$01bC,$0,$01bE,$0
bitplane_lower:     dc.w $e0,$0000,$e2,$0000
                    dc.w $e8,$0000,$ea,$0000
                    dc.w $f0,$0000,$f2,$0000
                    dc.w $f8,$0000,$fa,$0000
bitplane_upper:     dc.w $e4,$0000,$e6,$0000
                    dc.w $ec,$0000,$ee,$0000
                    dc.w $f4,$0000,$f6,$0000
                    dc.w $fc,$0000,$fe,$0000

                    dc.w $6e07,$fffe,$0100,$0610
                    dc.l -2

mouse_sprite:       dc.l 0
;-----------------------------------------------------------------------------

;-----------------------------------------------------------------------------
                    section screens,bss_c
;-----------------------------------------------------------------------------
screen1:            ds.b screen_length*4
screen2:            ds.b screen_length*4
;-----------------------------------------------------------------------------