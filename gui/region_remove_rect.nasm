%include 'inc/func.inc'
%include 'inc/gui.inc'

	fn_function gui/region_remove_rect
		;inputs
		;r0 = region heap pointer
		;r1 = source region listhead pointer
		;r8 = x (pixels)
		;r9 = y (pixels)
		;r10 = x1 (pixels)
		;r11 = y1 (pixels)
		;trashes
		;r1-r2, r5-r15

		;check for any obvious errors in inputs
		if r10, >, r8
			if r11, >, r9
				;run through source region list
				vp_cpy r1, r5
				loop_flist_forward r1, r7, r6
					;not in contact ?
					vp_cpy_i [r7 + gui_rect_x], r12
					continueif r12, >=, r10
					vp_cpy_i [r7 + gui_rect_y], r13
					continueif r13, >=, r11
					vp_cpy_i [r7 + gui_rect_x1], r14
					continueif r8, >=, r14
					vp_cpy_i [r7 + gui_rect_y1], r15
					continueif r9, >=, r15

					;jump to correct splitting code
					vp_jmpif r12, >=, r8, rem_split1
					vp_jmpif r13, >=, r9, rem_split2
					vp_jmpif r10, >=, r14, rem_split4
					vp_jmpif r11, >=, r15, rem_xyx1

				rem_xyx1y1:
					;r8 + r9 + r10 + r11 inside
					;bottom part
					vp_cpy_i r11, [r7 + gui_rect_y]
					;right part
					s_call sys_heap, alloc, {r0}, {r1}
					continueif r1, ==, 0
					ln_add_fnode r5, r1, r2
					vp_cpy_i r10, [r1 + gui_rect_x]
					vp_cpy_i r9, [r1 + gui_rect_y]
					vp_cpy_i r14, [r1 + gui_rect_x1]
					vp_cpy_i r11, [r1 + gui_rect_y1]
					;left part
					s_call sys_heap, alloc, {r0}, {r1}
					continueif r1, ==, 0
					ln_add_fnode r5, r1, r2
					vp_cpy_i r12, [r1 + gui_rect_x]
					vp_cpy_i r9, [r1 + gui_rect_y]
					vp_cpy_i r8, [r1 + gui_rect_x1]
					vp_cpy_i r11, [r1 + gui_rect_y1]
					;top part
					s_call sys_heap, alloc, {r0}, {r1}
					continueif r1, ==, 0
					ln_add_fnode r5, r1, r2
					vp_cpy_i r12, [r1 + gui_rect_x]
					vp_cpy_i r13, [r1 + gui_rect_y]
					vp_cpy_i r14, [r1 + gui_rect_x1]
					vp_cpy_i r9, [r1 + gui_rect_y1]
					continue

				rem_split1:
					;jump to correct splitting code
					vp_jmpif r13, >=, r9, rem_split3
					vp_jmpif r10, >=, r14, rem_split5
					vp_jmpif r11, >=, r15, rem_yx1

				rem_yx1y1:
					;r9 + r10 + r11 inside
					;bottom part
					vp_cpy_i r11, [r7 + gui_rect_y]
					;right part
					s_call sys_heap, alloc, {r0}, {r1}
					continueif r1, ==, 0
					ln_add_fnode r5, r1, r2
					vp_cpy_i r10, [r1 + gui_rect_x]
					vp_cpy_i r9, [r1 + gui_rect_y]
					vp_cpy_i r14, [r1 + gui_rect_x1]
					vp_cpy_i r11, [r1 + gui_rect_y1]
					;top part
					s_call sys_heap, alloc, {r0}, {r1}
					continueif r1, ==, 0
					ln_add_fnode r5, r1, r2
					vp_cpy_i r12, [r1 + gui_rect_x]
					vp_cpy_i r13, [r1 + gui_rect_y]
					vp_cpy_i r14, [r1 + gui_rect_x1]
					vp_cpy_i r9, [r1 + gui_rect_y1]
					continue

				rem_split2:
					;jump to correct splitting code
					vp_jmpif r10, >=, r14, rem_split6
					vp_jmpif r11, >=, r15, rem_xx1

				rem_xx1y1:
					;r8 + r10 + r11 inside
					;bottom part
					vp_cpy_i r11, [r7 + gui_rect_y]
					;right part
					s_call sys_heap, alloc, {r0}, {r1}
					continueif r1, ==, 0
					ln_add_fnode r5, r1, r2
					vp_cpy_i r10, [r1 + gui_rect_x]
					vp_cpy_i r13, [r1 + gui_rect_y]
					vp_cpy_i r14, [r1 + gui_rect_x1]
					vp_cpy_i r11, [r1 + gui_rect_y1]
					;left part
					s_call sys_heap, alloc, {r0}, {r1}
					continueif r1, ==, 0
					ln_add_fnode r5, r1, r2
					vp_cpy_i r12, [r1 + gui_rect_x]
					vp_cpy_i r13, [r1 + gui_rect_y]
					vp_cpy_i r8, [r1 + gui_rect_x1]
					vp_cpy_i r11, [r1 + gui_rect_y1]
					continue

				rem_split3:
					;jump to correct splitting code
					vp_jmpif r10, >=, r14, rem_split7
					vp_jmpif r11, >=, r15, rem_x1

				rem_x1y1:
					;r10 + r11 inside
					;bottom part
					vp_cpy_i r11, [r7 + gui_rect_y]
					;right part
					s_call sys_heap, alloc, {r0}, {r1}
					continueif r1, ==, 0
					ln_add_fnode r5, r1, r2
					vp_cpy_i r10, [r1 + gui_rect_x]
					vp_cpy_i r13, [r1 + gui_rect_y]
					vp_cpy_i r14, [r1 + gui_rect_x1]
					vp_cpy_i r11, [r1 + gui_rect_y1]
					continue

				rem_split4:
					;jump to correct splitting code
					vp_jmpif r11, >=, r15, rem_xy

				rem_xyy1:
					;r8 + r9 + r11 inside
					;bottom part
					vp_cpy_i r11, [r7 + gui_rect_y]
					;left part
					s_call sys_heap, alloc, {r0}, {r1}
					continueif r1, ==, 0
					ln_add_fnode r5, r1, r2
					vp_cpy_i r12, [r1 + gui_rect_x]
					vp_cpy_i r9, [r1 + gui_rect_y]
					vp_cpy_i r8, [r1 + gui_rect_x1]
					vp_cpy_i r11, [r1 + gui_rect_y1]
					;top part
					s_call sys_heap, alloc, {r0}, {r1}
					continueif r1, ==, 0
					ln_add_fnode r5, r1, r2
					vp_cpy_i r12, [r1 + gui_rect_x]
					vp_cpy_i r13, [r1 + gui_rect_y]
					vp_cpy_i r14, [r1 + gui_rect_x1]
					vp_cpy_i r9, [r1 + gui_rect_y1]
					continue

				rem_split5:
					;jump to correct splitting code
					vp_jmpif r11, >=, r15, rem_y

				rem_yy1:
					;r9 + r11 inside
					;bottom part
					vp_cpy_i r11, [r7 + gui_rect_y]
					;top part
					s_call sys_heap, alloc, {r0}, {r1}
					continueif r1, ==, 0
					ln_add_fnode r5, r1, r2
					vp_cpy_i r12, [r1 + gui_rect_x]
					vp_cpy_i r13, [r1 + gui_rect_y]
					vp_cpy_i r14, [r1 + gui_rect_x1]
					vp_cpy_i r9, [r1 + gui_rect_y1]
					continue

				rem_split6:
					;jump to correct splitting code
					vp_jmpif r11, >=, r15, rem_x

				rem_xy1:
					;r8 + r11 inside
					;bottom part
					vp_cpy_i r11, [r7 + gui_rect_y]
					;left part
					s_call sys_heap, alloc, {r0}, {r1}
					continueif r1, ==, 0
					ln_add_fnode r5, r1, r2
					vp_cpy_i r12, [r1 + gui_rect_x]
					vp_cpy_i r13, [r1 + gui_rect_y]
					vp_cpy_i r8, [r1 + gui_rect_x1]
					vp_cpy_i r11, [r1 + gui_rect_y1]
					continue

				rem_split7:
					;jump to correct splitting code
					vp_jmpif r11, >=, r15, rem_encl

				rem_y1:
					;r11 inside
					;bottom part
					vp_cpy_i r11, [r7 + gui_rect_y]
					continue

				rem_xyx1:
					;r8 + r9 + r10 inside
					;left part
					vp_cpy_i r9, [r7 + gui_rect_y]
					vp_cpy_i r8, [r7 + gui_rect_x1]
					;right part
					s_call sys_heap, alloc, {r0}, {r1}
					continueif r1, ==, 0
					ln_add_fnode r5, r1, r2
					vp_cpy_i r10, [r1 + gui_rect_x]
					vp_cpy_i r9, [r1 + gui_rect_y]
					vp_cpy_i r14, [r1 + gui_rect_x1]
					vp_cpy_i r15, [r1 + gui_rect_y1]
					;top part
					s_call sys_heap, alloc, {r0}, {r1}
					continueif r1, ==, 0
					ln_add_fnode r5, r1, r2
					vp_cpy_i r12, [r1 + gui_rect_x]
					vp_cpy_i r13, [r1 + gui_rect_y]
					vp_cpy_i r14, [r1 + gui_rect_x1]
					vp_cpy_i r9, [r1 + gui_rect_y1]
					continue

				rem_encl:
					;region is enclosed
					vp_cpy r7, r1
					ln_remove_fnode r7, r6
					hp_freecell r0, r1, r2
					continue

				rem_x:
					;r8 inside
					;left part
					vp_cpy_i r8, [r7 + gui_rect_x1]
					continue

				rem_y:
					;r9 inside
					;top part
					vp_cpy_i r9, [r7 + gui_rect_y1]
					continue

				rem_xy:
					;r8 + r9 inside
					;left part
					vp_cpy_i r9, [r7 + gui_rect_y]
					vp_cpy_i r8, [r7 + gui_rect_x1]
					;top part
					s_call sys_heap, alloc, {r0}, {r1}
					continueif r1, ==, 0
					ln_add_fnode r5, r1, r2
					vp_cpy_i r12, [r1 + gui_rect_x]
					vp_cpy_i r13, [r1 + gui_rect_y]
					vp_cpy_i r14, [r1 + gui_rect_x1]
					vp_cpy_i r9, [r1 + gui_rect_y1]
					continue

				rem_x1:
					;r10 inside
					;right part
					vp_cpy_i r10, [r7 + gui_rect_x]
					continue

				rem_xx1:
					;r8 + r10 inside
					;right part
					vp_cpy_i r10, [r7 + gui_rect_x]
					;left part
					s_call sys_heap, alloc, {r0}, {r1}
					continueif r1, ==, 0
					ln_add_fnode r5, r1, r2
					vp_cpy_i r12, [r1 + gui_rect_x]
					vp_cpy_i r13, [r1 + gui_rect_y]
					vp_cpy_i r8, [r1 + gui_rect_x1]
					vp_cpy_i r15, [r1 + gui_rect_y1]
					continue

				rem_yx1:
					;r9 + r10 inside
					;right part
					vp_cpy_i r10, [r7 + gui_rect_x]
					vp_cpy_i r9, [r7 + gui_rect_y]
					;top part
					s_call sys_heap, alloc, {r0}, {r1}
					continueif r1, ==, 0
					ln_add_fnode r5, r1, r2
					vp_cpy_i r12, [r1 + gui_rect_x]
					vp_cpy_i r13, [r1 + gui_rect_y]
					vp_cpy_i r14, [r1 + gui_rect_x1]
					vp_cpy_i r9, [r1 + gui_rect_y1]
				loop_end
			endif
		endif
		vp_ret

	fn_function_end
