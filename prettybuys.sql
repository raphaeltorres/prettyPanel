-- Module
SELECT module_id,module_name,module_description,module_function
FROM tbl_group AS g
LEFT JOIN tbl_group_member AS gm ON g.group_id = gm.gm_group_id
INNER JOIN tbl_account AS u ON gm.gm_user_id = u.user_id
INNER JOIN tbl_group_access AS ga ON ga.ga_group_id = g.group_id
INNER JOIN tbl_module AS m ON m.module_id = ga.ga_module_id 
WHERE gm.gm_user_id = 2 
ORDER BY m.module_id ASC

-- All Modules
SELECT * FROM tbl_module ORDER BY module_id ASC

-- Node
SELECT node_id,node_module_id,node_name,node_description,node_function FROM 
tbl_group AS g
LEFT JOIN tbl_group_member AS gm ON g.group_id = gm.gm_group_id
INNER JOIN tbl_account AS u ON gm.gm_user_id = u.user_id
INNER JOIN tbl_group_access AS ga ON ga.ga_group_id = g.group_id
INNER JOIN tbl_module AS m ON m.module_id = ga.ga_module_id 
INNER JOIN tbl_node AS n ON n.node_module_id = m.module_id
WHERE gm.gm_user_id =2 AND n.node_id AND node_name NOT LIKE '%functions%'
ORDER BY n.node_id ASC

