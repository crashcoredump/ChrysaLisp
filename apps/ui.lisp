;import ui settings
(bind '(
	flow_flag_left flow_flag_right flow_flag_up flow_flag_down
	flow_flag_fillw flow_flag_fillh flow_flag_lastw flow_flag_lasth
	flow_flag_align_hcenter flow_flag_align_hleft flow_flag_align_hright
	flow_flag_align_vcenter flow_flag_align_vtop flow_flag_align_vbottom
	ev_msg_target_id ev_msg_action_source_id
	kn_call_open
	slot_set_title slot_set_status)
	(within-compile-env (lambda ()
		(import 'gui/gui.inc)
		(import 'class/flow/flow.inc)
		(import 'class/window/window.inc)
		(import 'sys/kernel/kernel.inc)
		(list flow_flag_left flow_flag_right flow_flag_up flow_flag_down
			flow_flag_fillw flow_flag_fillh flow_flag_lastw flow_flag_lasth
			flow_flag_align_hcenter flow_flag_align_hleft flow_flag_align_hright
			flow_flag_align_vcenter flow_flag_align_vtop flow_flag_align_vbottom
			ev_msg_target_id ev_msg_action_source_id
			kn_call_open
			(method-slot 'window 'set_title) (method-slot 'window 'set_status)))))