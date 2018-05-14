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
--   Date and Time:   13:49 Понедельник Май 14, 2018
--   Exported By:     FCR
--   Flashback:       0
--   Export Type:     Page Export
--   Version:         5.1.4.00.08
--   Instance ID:     218235226215706
--

prompt --application/pages/delete_00032
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>32);
end;
/
prompt --application/pages/page_00032
begin
wwv_flow_api.create_page(
 p_id=>32
,p_user_interface_id=>wwv_flow_api.id(11866208218552473)
,p_name=>'AccountBalance'
,p_page_mode=>'MODAL'
,p_step_title=>'Баланс по счету'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(12122140227731315)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'GERA'
,p_last_upd_yyyymmddhh24miss=>'20180503150742'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(28758743791026665)
,p_name=>'Счет &P32_ACCOUNT_NUM.'
,p_template=>wwv_flow_api.id(11832695845552332)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'BODY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    TO_DATE(PERIOD,''mm.yyyy'') PERIOD,',
'    CHARGE_SUM_MN,',
'    PAY_SUM_MN,',
'    CHARGE_SUM_TOTAL,',
'    PAY_SUM_TOTAL,',
'    -1*DOLG_SUM_TOTAL BALANCE,',
'    CASE WHEN -1*DOLG_SUM_TOTAL < 0 THEN ''RED'' ELSE ''GREEN'' END BAlCOLOR',
'from ',
'    V_TOTAL_ACCOUNT ',
'where ',
'    account_id = :P32_ACCOUNT_ID ',
''))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(11842624439552356)
,p_query_num_rows=>1000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_no_data_found=>'Данные временно недоступны. '
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Сохранить в CSV файл'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_exp_filename=>'account_balance.csv'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(14464664484786964)
,p_query_column_id=>1
,p_column_alias=>'PERIOD'
,p_column_display_sequence=>1
,p_column_heading=>'Период'
,p_use_as_row_header=>'N'
,p_column_format=>'MM.YYYY'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(14462272621786959)
,p_query_column_id=>2
,p_column_alias=>'CHARGE_SUM_MN'
,p_column_display_sequence=>2
,p_column_heading=>'Начислено за период'
,p_use_as_row_header=>'N'
,p_column_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(14462603469786959)
,p_query_column_id=>3
,p_column_alias=>'PAY_SUM_MN'
,p_column_display_sequence=>3
,p_column_heading=>'Оплачено за период'
,p_use_as_row_header=>'N'
,p_column_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(14463035834786960)
,p_query_column_id=>4
,p_column_alias=>'CHARGE_SUM_TOTAL'
,p_column_display_sequence=>4
,p_column_heading=>'Начислено за все время'
,p_use_as_row_header=>'N'
,p_column_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(14463452332786960)
,p_query_column_id=>5
,p_column_alias=>'PAY_SUM_TOTAL'
,p_column_display_sequence=>5
,p_column_heading=>'Оплачено за все время'
,p_use_as_row_header=>'N'
,p_column_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(14463804440786962)
,p_query_column_id=>6
,p_column_alias=>'BALANCE'
,p_column_display_sequence=>6
,p_column_heading=>'Баланс счета на конец периода'
,p_use_as_row_header=>'N'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span style="color:#BALCOLOR#">#BALANCE#</span>',
''))
,p_column_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(14464203765786962)
,p_query_column_id=>7
,p_column_alias=>'BALCOLOR'
,p_column_display_sequence=>7
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14465108334790303)
,p_name=>'P32_ACCOUNT_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(28758743791026665)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14465437889792670)
,p_name=>'P32_ACCOUNT_NUM'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(28758743791026665)
,p_use_cache_before_default=>'NO'
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
