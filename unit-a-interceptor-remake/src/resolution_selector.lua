-- 

res_list = {"640x400", "640x480", "640x512", "800x600", "1280x720", "1600x900", "1920x1080", "1920x1200"}

rs_gui = nil
rs_check = 0
rs_combo = 0

function resolution_selector_init()
	rs_gui = gs.GetDearImGui()

	rs_check = true
	rs_combo = 4
end

function set_new_resolution()
	res_str = res_list[rs_combo + 1]:split("x")
	SCR_WIDTH = res_str[1]
	SCR_HEIGHT = res_str[2]
	ZOOM_RATIO = SCR_HEIGHT / 287
	DEMO_STATE = change_resolution
	demo_close_screen()
end

function change_resolution()
	demo_open_screen()
	DEMO_STATE = demo_init
end

function resolution_selector()
	rs_gui:SetNextWindowPos(0, 0)
	rs_gui:SetNextWindowSize(SCR_WIDTH, SCR_HEIGHT)

	if rs_gui:Begin("Unit-A Interceptor Demo") then
			rs_gui:Text("Select your screen resolution")
			rs_combo = rs_gui:Combo("", res_list, rs_combo)			
			if rs_gui:Button("Start demo") then
				print("Demo start")
				set_new_resolution()
				DEMO_STATE = set_new_resolution
				return
			end
	end

	rs_gui:End()

	return
end