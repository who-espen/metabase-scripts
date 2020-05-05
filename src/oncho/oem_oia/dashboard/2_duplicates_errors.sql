/*
 * File: 2_duplicates_errors.sql
 * File Created: Saturday, 2nd May 2020 4:42:43 pm
 * Author: Dyesse YUMBA
 * Last Modified: Tuesday, 5th May 2020 1:17:26 pm
 * Modified By: Dyesse YUMBA
 * -----
 * (c) 2020, WHO/AFRO/UCN/ESPEN
 */


/*
 * A query for listing all records that use the same ID twice
 * Variable to rename <%v_ab_cde_fgh_3_participant%>
 */
 SELECT
  "Form",
  district,
  cluster_id,
  cluster_name,
  "Barcode ID",
  "Recorder ID",
  "Age in Years",
  "Year lived in the village",
  "Sex",
  "OV 16 result",
  date,
  "Status"

FROM (
  SELECT
  m.form "Form",
  p.p_district district,
  p.p_cluster_id cluster_id,
  p.p_cluster_name cluster_name,
  m.barcode_participant "Barcode ID",
  p.p_recorder_id "Recorder ID",
  p.p_age_yrs "Age in Years",
  p.p_how_long_lived "Year lived in the village",
  p.p_sex "Sex",
  null "OV 16 result",
  p.p_date date,
  status "Status"

FROM <%metabase_oncho_oem_duplicates_202004%> AS m, <%v_ab_cde_fgh_3_participant%> AS p
  WHERE p.id = m.id_participant

UNION ALL

SELECT
  m.form "Form",
  d.d_district district,
  d.d_cluster_id cluster_name,
  d.d_cluster_name cluster_name,
  m.barcode_results "Barcode ID",
  d.d_recorder_id "Recorder ID",
  null "Age in Years",
  null "Year lived in the village",
  null "Sex",
  null "OV 16 result",
  d.d_date date,
  status "Status"

FROM <%metabase_oncho_oem_duplicates_202004%> AS m, <%v_ab_cde_fgh_3_rdt_ov16%> AS d
  WHERE d.id = m.id_results
) src

WHERE "Form" IS NOT NULL
------ Metabase filter -------
-- [[and {{cluster_id}}]]
-- [[and {{cluster_name}}]]
-- [[and {{district}}]]
-- [[and {{date}}]]
