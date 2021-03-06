(import 'class/component/class.inc)

(def-class 'view 'component)
(dec-method 'vtable 'class/class_view)
(dec-method 'init 'class/view/init)
(dec-method 'add_front 'class/view/add_front 'static '(r0 r1) '(r0))
(dec-method 'add_back 'class/view/add_back 'static '(r0 r1) '(r0))
(dec-method 'sub 'class/view/sub 'static '(r0) '(r0))
(dec-method 'to_front 'class/view/to_front 'static '(r0) '(r0))
(dec-method 'add_dirty 'class/view/add_dirty 'static '(r0 r7 r8 r9 r10) '(r0))
(dec-method 'add_opaque 'class/view/add_opaque 'static '(r0 r7 r8 r9 r10) '(r0))
(dec-method 'sub_opaque 'class/view/sub_opaque 'static '(r0 r7 r8 r9 r10) '(r0))
(dec-method 'get_relative 'class/view/get_relative 'static '(r0 r1 r7 r8) '(r0 r7 r8))
(dec-method 'dirty 'class/view/dirty 'static '(r0) '(r0))
(dec-method 'dirty_all 'class/view/dirty_all 'static '(r0) '(r0))
(dec-method 'opaque 'class/view/opaque 'static '(r0) '(r0))
(dec-method 'forward 'class/view/forward 'static '(r0 r1 r2) '(r0))
(dec-method 'backward 'class/view/backward 'static '(r0 r1 r2) '(r0))
(dec-method 'forward_tree 'class/view/forward_tree 'static '(r0 r1 r2 r3) '(r0))
(dec-method 'backward_tree 'class/view/backward_tree 'static '(r0 r1 r2 r3) '(r0))
(dec-method 'change 'class/view/change 'static '(r0 r7 r8 r9 r10) '(r0))
(dec-method 'hit_tree 'class/view/hit_tree 'static '(r0 r7 r8) '(r0 r1 r7 r8))
(dec-method 'find_id 'class/view/find_id 'static '(r0 r1) '(r0 r1))
(dec-method 'draw_panel 'class/view/draw_panel 'static '(r0 r1 r2 r3) '(r0))
(dec-method 'get_bounds 'class/view/get_bounds 'static '(r0) '(r0 r7 r8 r9 r10))
(dec-method 'set_bounds 'class/view/set_bounds 'static '(r0 r7 r8 r9 r10) '(r0))
(dec-method 'get_first 'class/view/get_first 'static '(r0) '(r0 r1))
(dec-method 'get_last 'class/view/get_last 'static '(r0) '(r0 r1))

(dec-method 'lisp_sub 'class/view/lisp_sub 'static '(r0 r1) '(r0 r1))
(dec-method 'lisp_add_child 'class/view/lisp_add_child 'static '(r0 r1) '(r0 r1))
(dec-method 'lisp_add_front 'class/view/lisp_add_front 'static '(r0 r1) '(r0 r1))
(dec-method 'lisp_add_back 'class/view/lisp_add_back 'static '(r0 r1) '(r0 r1))
(dec-method 'lisp_pref_size 'class/view/lisp_pref_size 'static '(r0 r1) '(r0 r1))
(dec-method 'lisp_change 'class/view/lisp_change 'static '(r0 r1) '(r0 r1))
(dec-method 'lisp_set_bounds 'class/view/lisp_set_bounds 'static '(r0 r1) '(r0 r1))
(dec-method 'lisp_get_bounds 'class/view/lisp_get_bounds 'static '(r0 r1) '(r0 r1))
(dec-method 'lisp_add_opaque 'class/view/lisp_add_opaque 'static '(r0 r1) '(r0 r1))
(dec-method 'lisp_sub_opaque 'class/view/lisp_sub_opaque 'static '(r0 r1) '(r0 r1))
(dec-method 'lisp_opaque 'class/view/lisp_opaque 'static '(r0 r1) '(r0 r1))
(dec-method 'lisp_add_dirty 'class/view/lisp_add_dirty 'static '(r0 r1) '(r0 r1))
(dec-method 'lisp_dirty 'class/view/lisp_dirty 'static '(r0 r1) '(r0 r1))
(dec-method 'lisp_dirty_all 'class/view/lisp_dirty_all 'static '(r0 r1) '(r0 r1))
(dec-method 'lisp_layout 'class/view/lisp_layout 'static '(r0 r1) '(r0 r1))
(dec-method 'lisp_event 'class/view/lisp_event 'static '(r0 r1) '(r0 r1))
(dec-method 'lisp_find_id 'class/view/lisp_find_id 'static '(r0 r1) '(r0 r1))

(dec-method 'deinit 'class/view/deinit 'override)

(dec-method 'add_child 'class/view/add_back 'virtual '(r0 r1) '(r0))
(dec-method 'draw 'class/obj/null 'virtual '(r0 r1) '(r0))
(dec-method 'hit 'class/view/hit 'virtual '(r0 r7 r8) '(r0 r1))
(dec-method 'pref_size 'class/view/pref_size 'virtual '(r0) '(r0 r9 r10))
(dec-method 'layout 'class/obj/null 'virtual '(r0) '(r0))
(dec-method 'event 'class/view/event 'virtual '(r0 r1) '(r0))
(dec-method 'mouse_down 'class/obj/null 'virtual '(r0 r1) '(r0))
(dec-method 'mouse_up 'class/obj/null 'virtual '(r0 r1) '(r0))
(dec-method 'mouse_move 'class/obj/null 'virtual '(r0 r1) '(r0))
(dec-method 'mouse_hover 'class/obj/null 'virtual '(r0 r1) '(r0))
(dec-method 'key_down 'class/obj/null 'virtual '(r0 r1) '(r0))
(dec-method 'key_up 'class/obj/null 'virtual '(r0 r1) '(r0))

(def-bit 'view_flag)
	(bit 'solid)
(def-bit-end)

(def-struct 'view 'component)
	(offset 'start)
	(struct 'node 'ln_node)
	(struct 'list 'lh_list)
	(ptr 'dirty_region)
	(ptr 'opaque_region)
	(ptr 'ctx_node)
	(uint 'last_buttons)
	(uint 'flags)
	(int 'ctx_x)
	(int 'ctx_y)
	(int 'x)
	(int 'y)
	(int 'w)
	(int 'h)
(def-struct-end)
