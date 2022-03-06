ALTER TABLE replication_policy ADD COLUMN dest_namespace_replace_count int;
UPDATE replication_policy SET dest_namespace_replace_count=-1 WHERE dest_namespace IS NOT NULL;

CREATE INDEX idx_audit_log_op_time ON audit_log (op_time);