
#create-table-mssql
IF  NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'"AKKA_PROJECTION_OFFSET_STORE"') AND type in (N'U'))
begin
create table "AKKA_PROJECTION_OFFSET_STORE" (
  "PROJECTION_NAME" VARCHAR(255) NOT NULL,
  "PROJECTION_KEY" VARCHAR(255) NOT NULL,
  "CURRENT_OFFSET" VARCHAR(255) NOT NULL,
  "MANIFEST" VARCHAR(4) NOT NULL,
  "MERGEABLE" BIT NOT NULL,
  "LAST_UPDATED" BIGINT NOT NULL
)

alter table "AKKA_PROJECTION_OFFSET_STORE" add constraint "PK_PROJECTION_ID" primary key("PROJECTION_NAME","PROJECTION_KEY")

create index "PROJECTION_NAME_INDEX" on "AKKA_PROJECTION_OFFSET_STORE" ("PROJECTION_NAME")
end
#create-table-mssql
