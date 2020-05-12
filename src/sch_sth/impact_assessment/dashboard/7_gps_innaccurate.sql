/*
 * File: 7_gps_innaccurate.sql
 * File Created: Tuesday, 12th May 2020 1:36:06 pm
 * Author: Dyesse YUMBA
 * Last Modified: Tuesday, 12th May 2020 1:37:13 pm
 * Modified By: Dyesse YUMBA
 * -----
 * (c) 2020, WHO/AFRO/UCN/ESPEN
 */

/*
 * This card will list all records with innacurate GPS
 * Variable to rename <%v_ab_cde_fgh_1_school%>
 */
SELECT

w_recorder_id,
w_district,
w_school_id,
w_school_name,
w_gps_acc

FROM <%v_ab_cde_fgh_1_school%>
WHERE w_gps_acc > 20

  ------ Metabase filter -------
  -- [[and {{c_cluster_id}}]]
  -- [[and {{cluster_name}}]]
  -- [[and {{district}}]]
  -- [[and {{date}}]]

