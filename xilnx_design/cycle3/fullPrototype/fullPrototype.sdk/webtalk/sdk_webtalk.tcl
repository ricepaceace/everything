webtalk_init -webtalk_dir /home/greg/everything/xilnx_design/cycle3/fullPrototype/fullPrototype.sdk/webtalk
webtalk_register_client -client project
webtalk_add_data -client project -key date_generated -value "Sun Apr 9 20:00:54 2017" -context "software_version_and_target_device"
webtalk_add_data -client project -key product_version -value "SDK v2016.2" -context "software_version_and_target_device"
webtalk_add_data -client project -key build_version -value "2016.2" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_platform -value "amd64" -context "software_version_and_target_device"
webtalk_add_data -client project -key registration_id -value "" -context "software_version_and_target_device"
webtalk_add_data -client project -key tool_flow -value "SDK" -context "software_version_and_target_device"
webtalk_add_data -client project -key beta -value "false" -context "software_version_and_target_device"
webtalk_add_data -client project -key route_design -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_family -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_device -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_package -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_speed -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key random_id -value "pdt1n7qmvrtsnllehel29ro47l" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_id -value "2016.2_23" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_iteration -value "23" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_name -value "" -context "user_environment"
webtalk_add_data -client project -key os_release -value "" -context "user_environment"
webtalk_add_data -client project -key cpu_name -value "" -context "user_environment"
webtalk_add_data -client project -key cpu_speed -value "" -context "user_environment"
webtalk_add_data -client project -key total_processors -value "" -context "user_environment"
webtalk_add_data -client project -key system_ram -value "" -context "user_environment"
webtalk_register_client -client sdk
webtalk_add_data -client sdk -key uid -value "1491782274000" -context "sdk\\\\bsp/1491782274000"
webtalk_add_data -client sdk -key hwid -value "1488342715000" -context "sdk\\\\bsp/1491782274000"
webtalk_add_data -client sdk -key os -value "standalone" -context "sdk\\\\bsp/1491782274000"
webtalk_add_data -client sdk -key apptemplate -value "empty_application" -context "sdk\\\\bsp/1491782274000"
webtalk_add_data -client sdk -key uid -value "1491782275000" -context "sdk\\\\application/1491782275000"
webtalk_add_data -client sdk -key hwid -value "1488342715000" -context "sdk\\\\application/1491782275000"
webtalk_add_data -client sdk -key bspid -value "1491782274000" -context "sdk\\\\application/1491782275000"
webtalk_add_data -client sdk -key newbsp -value "true" -context "sdk\\\\application/1491782275000"
webtalk_add_data -client sdk -key os -value "standalone" -context "sdk\\\\application/1491782275000"
webtalk_add_data -client sdk -key apptemplate -value "empty_application" -context "sdk\\\\application/1491782275000"
webtalk_transmit -clientid 3908196566 -regid "" -xml /home/greg/everything/xilnx_design/cycle3/fullPrototype/fullPrototype.sdk/webtalk/usage_statistics_ext_sdk.xml -html /home/greg/everything/xilnx_design/cycle3/fullPrototype/fullPrototype.sdk/webtalk/usage_statistics_ext_sdk.html -wdm /home/greg/everything/xilnx_design/cycle3/fullPrototype/fullPrototype.sdk/webtalk/sdk_webtalk.wdm -intro "<H3>SDK Usage Report</H3><BR>"
webtalk_terminate
