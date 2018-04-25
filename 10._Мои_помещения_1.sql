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
--   Date and Time:   14:01 Среда Апрель 25, 2018
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
,p_last_upd_yyyymmddhh24miss=>'20180425135253'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(14296818454239708)
,p_name=>'Баланс по счету &P10_ACCOUNT_NUM.'
,p_template=>wwv_flow_api.id(11832695845552332)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'BODY'
,p_source=>'select ACCOUNT_ID, PERIOD from V_TOTAL_ACCOUNT where account_id = :P10_ACCOUNT_ID order by MN'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(11842624439552356)
,p_query_num_rows=>1000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(14296918214239709)
,p_query_column_id=>1
,p_column_alias=>'ACCOUNT_ID'
,p_column_display_sequence=>1
,p_column_heading=>'Account id'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(14297320229239713)
,p_query_column_id=>2
,p_column_alias=>'PERIOD'
,p_column_display_sequence=>2
,p_column_heading=>'Period'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
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
,p_source=>'select ACCOUNT_ID, ADDR, AREA_VAL, ACCOUNT_NUM from V_USER_ACCOUNTS where user_id = (select LK_AUTH.GET_USERID_BY_EMAIL(:APP_USER) from dual)'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(11842624439552356)
,p_query_num_rows=>10000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(14297112482239711)
,p_query_column_id=>1
,p_column_alias=>'ACCOUNT_ID'
,p_column_display_sequence=>4
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(14257555792243114)
,p_query_column_id=>2
,p_column_alias=>'ADDR'
,p_column_display_sequence=>1
,p_column_heading=>'Адрес помещения'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(14256731240243112)
,p_query_column_id=>3
,p_column_alias=>'AREA_VAL'
,p_column_display_sequence=>2
,p_column_heading=>'Площадь'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(14257107402243112)
,p_query_column_id=>4
,p_column_alias=>'ACCOUNT_NUM'
,p_column_display_sequence=>3
,p_column_heading=>'Номер счета'
,p_column_link=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:RP:P10_ACCOUNT_ID,P10_ACCOUNT_NUM:#ACCOUNT_ID#,#ACCOUNT_NUM#'
,p_column_linktext=>'#ACCOUNT_NUM#'
,p_column_link_attr=>'title="Баланс по счету"'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(14257965581243114)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(42651444838297959)
,p_button_name=>'AddAccount'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(11855494343552396)
,p_button_image_alt=>'Добавить помещение'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14296798130239707)
,p_name=>'P10_ACCOUNT_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(42651444838297959)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14297265328239712)
,p_name=>'P10_ACCOUNT_NUM'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(42651444838297959)
,p_source=>'(кликните на номере счета в списке Мои помещения)'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
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
