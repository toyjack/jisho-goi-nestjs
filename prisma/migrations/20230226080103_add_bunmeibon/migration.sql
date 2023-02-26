-- CreateTable
CREATE TABLE "BunmeiSetsuyoshu" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "bunmei_id" TEXT NOT NULL,
    "gotou" TEXT,
    "entry" TEXT,
    "entry_original" TEXT,
    "gokei" TEXT,
    "gokei_original" TEXT,
    "shouten" TEXT,
    "left_kun" TEXT,
    "defination" TEXT,
    "item_type" TEXT,
    "bu" TEXT,
    "mon" TEXT,
    "page" TEXT,
    "line" TEXT,
    "ndl_link" TEXT,
    "remark" TEXT
);

-- CreateIndex
CREATE UNIQUE INDEX "BunmeiSetsuyoshu_bunmei_id_key" ON "BunmeiSetsuyoshu"("bunmei_id");
