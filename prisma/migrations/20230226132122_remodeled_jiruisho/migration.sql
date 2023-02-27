/*
  Warnings:

  - You are about to drop the column `bubetsu_tsuban` on the `Jiruisho` table. All the data in the column will be lost.
  - You are about to drop the column `entry_length` on the `Jiruisho` table. All the data in the column will be lost.
  - You are about to drop the column `henbetsububesu_onkunban` on the `Jiruisho` table. All the data in the column will be lost.
  - You are about to drop the column `kun` on the `Jiruisho` table. All the data in the column will be lost.
  - You are about to drop the column `kun_matched` on the `Jiruisho` table. All the data in the column will be lost.
  - You are about to drop the column `kun_modern` on the `Jiruisho` table. All the data in the column will be lost.
  - You are about to drop the column `loc_kurokawa` on the `Jiruisho` table. All the data in the column will be lost.
  - You are about to drop the column `loc_maeda` on the `Jiruisho` table. All the data in the column will be lost.
  - You are about to drop the column `no_in_block` on the `Jiruisho` table. All the data in the column will be lost.
  - You are about to drop the column `on` on the `Jiruisho` table. All the data in the column will be lost.
  - You are about to drop the column `on_kun` on the `Jiruisho` table. All the data in the column will be lost.
  - You are about to drop the column `on_matched` on the `Jiruisho` table. All the data in the column will be lost.
  - You are about to drop the column `on_modern` on the `Jiruisho` table. All the data in the column will be lost.
  - You are about to drop the column `onkunbetsu_tsuban` on the `Jiruisho` table. All the data in the column will be lost.
  - You are about to drop the column `remark2` on the `Jiruisho` table. All the data in the column will be lost.
  - You are about to drop the column `shoten` on the `Jiruisho` table. All the data in the column will be lost.
  - You are about to drop the column `total_in_block` on the `Jiruisho` table. All the data in the column will be lost.
  - You are about to drop the column `tsuban` on the `Jiruisho` table. All the data in the column will be lost.
  - You are about to drop the column `variants_A` on the `Jiruisho` table. All the data in the column will be lost.
  - You are about to drop the column `variants_A_no` on the `Jiruisho` table. All the data in the column will be lost.
  - You are about to drop the column `variants_B` on the `Jiruisho` table. All the data in the column will be lost.
  - You are about to drop the column `variants_B_no` on the `Jiruisho` table. All the data in the column will be lost.
  - You are about to drop the column `variants_C` on the `Jiruisho` table. All the data in the column will be lost.
  - You are about to drop the column `variants_C_no` on the `Jiruisho` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Jiruisho" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "entry" TEXT,
    "entry_expression" TEXT,
    "shouten" TEXT,
    "hen" TEXT,
    "bu" TEXT,
    "maeda_loc" TEXT,
    "maeda_ndl_url" TEXT,
    "kurokawa_loc" TEXT,
    "kurokawa_ndl_url" TEXT,
    "onkun" TEXT,
    "char_count" TEXT,
    "gokei_display" TEXT,
    "gokei_search_original" TEXT,
    "gokei_search_current" TEXT,
    "defination" TEXT,
    "remark" TEXT
);
INSERT INTO "new_Jiruisho" ("bu", "defination", "entry", "hen", "id", "remark") SELECT "bu", "defination", "entry", "hen", "id", "remark" FROM "Jiruisho";
DROP TABLE "Jiruisho";
ALTER TABLE "new_Jiruisho" RENAME TO "Jiruisho";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
