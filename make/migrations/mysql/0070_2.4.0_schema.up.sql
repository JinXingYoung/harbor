/* cleanup deleted user project members */
DELETE FROM project_member WHERE project_member.entity_type = 'u' AND EXISTS (SELECT NULL FROM harbor_user WHERE project_member.entity_id = harbor_user.user_id AND harbor_user.deleted = true );

ALTER TABLE replication_policy ADD COLUMN speed_kb int;

/* add version fields for lock free quota */
ALTER TABLE quota ADD COLUMN version bigint DEFAULT 0;
ALTER TABLE quota_usage ADD COLUMN version bigint DEFAULT 0;

/* convert Negligible to None for the severity of the vulnerability record */
UPDATE vulnerability_record SET severity='None' WHERE severity='Negligible';
