-- RedefineIndex
DROP INDEX "sqlite_autoindex_authtoken_token_2";
CREATE UNIQUE INDEX "Token_user_id_key" ON "Token"("user_id");
