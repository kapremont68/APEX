prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2016.08.24'
,p_release=>'5.1.4.00.08'
,p_default_workspace_id=>11800973272798664
,p_default_application_id=>103
,p_default_owner=>'FCR'
);
end;
/
 
prompt APPLICATION 103 - LK
--
-- Application Export:
--   Application:     103
--   Name:            LK
--   Date and Time:   15:51 Среда Май 30, 2018
--   Exported By:     FCR
--   Flashback:       0
--   Export Type:     Page Export
--   Version:         5.1.4.00.08
--   Instance ID:     218235226215706
--

prompt --application/pages/delete_00010
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>10);
end;
/
prompt --application/pages/page_00010
begin
wwv_flow_api.create_page(
 p_id=>10
,p_user_interface_id=>wwv_flow_api.id(11866208218552473)
,p_name=>'MyRooms'
,p_page_mode=>'NORMAL'
,p_step_title=>'Мои помещения'
,p_step_sub_title=>'MyRooms'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(12122140227731315)
,p_step_template=>wwv_flow_api.id(12101358466597064)
,p_page_template_options=>'#DEFAULT#'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'GERA'
,p_last_upd_yyyymmddhh24miss=>'20180529163456'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(42651444838297959)
,p_name=>'Мои помещения'
,p_template=>wwv_flow_api.id(11832695845552332)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'BODY'
,p_source=>'select ID, ACCOUNT_ID, ADDR, AREA_VAL, ACCOUNT_NUM from LK_USER_ACCOUNTS where user_id = (select LK_AUTH.GET_USERID_BY_EMAIL(:APP_USER) from dual)'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(11842624439552356)
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(14299168050239731)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>6
,p_column_link=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:RP:P5_ACCOUNT_ID,P5_ACCOUNT_NUM:#ACCOUNT_ID#,#ACCOUNT_NUM#'
,p_column_linktext=>'<span aria-hidden="true" class="fa fa-rub"></span>'
,p_column_link_attr=>'title="Мои платежи по счету"'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(14297112482239711)
,p_query_column_id=>2
,p_column_alias=>'ACCOUNT_ID'
,p_column_display_sequence=>5
,p_column_link=>'f?p=&APP_ID.:32:&SESSION.::&DEBUG.:RP:P32_ACCOUNT_ID,P32_ACCOUNT_NUM:#ACCOUNT_ID#,#ACCOUNT_NUM#'
,p_column_linktext=>'<span aria-hidden="true" class="fa fa-balance-scale"></span>'
,p_column_link_attr=>'title="Баланс по счету"'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(14257555792243114)
,p_query_column_id=>3
,p_column_alias=>'ADDR'
,p_column_display_sequence=>2
,p_column_heading=>'Адрес помещения'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(14256731240243112)
,p_query_column_id=>4
,p_column_alias=>'AREA_VAL'
,p_column_display_sequence=>3
,p_column_heading=>'Площадь'
,p_use_as_row_header=>'N'
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(14257107402243112)
,p_query_column_id=>5
,p_column_alias=>'ACCOUNT_NUM'
,p_column_display_sequence=>4
,p_column_heading=>'Номер счета'
,p_use_as_row_header=>'N'
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(14298835838239728)
,p_query_column_id=>6
,p_column_alias=>'DERIVED$01'
,p_column_display_sequence=>1
,p_column_link=>'f?p=&APP_ID.:33:&SESSION.::&DEBUG.:RP:P33_ID:#ID#'
,p_column_linktext=>' <span aria-hidden="true" class="t-Icon fa fa-trash-o"></span>'
,p_column_link_attr=>'class="t-Button t-Button--noLabel t-Button--icon t-Button--small t-Button--danger t-Button--link" title="Удалить помещение"'
,p_disable_sort_column=>'N'
,p_derived_column=>'Y'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(14257965581243114)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(42651444838297959)
,p_button_name=>'AddAccount'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(11855494343552396)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Добавить помещение'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:16:&SESSION.::&DEBUG.:RP::'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(14299421829239734)
,p_name=>'DelAccount closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(42651444838297959)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(14299568315239735)
,p_event_id=>wwv_flow_api.id(14299421829239734)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(42651444838297959)
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(14299662457239736)
,p_name=>'AddAccount closed'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(14257965581243114)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(14299794758239737)
,p_event_id=>wwv_flow_api.id(14299662457239736)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(42651444838297959)
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
