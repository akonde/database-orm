/*
  Warnings:

  - You are about to drop the column `moviesId` on the `Screening` table. All the data in the column will be lost.
  - You are about to drop the `Movies` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `movieId` to the `Screening` table without a default value. This is not possible if the table is not empty.
  - Added the required column `screenId` to the `Screening` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Screening" DROP CONSTRAINT "Screening_moviesId_fkey";

-- DropIndex
DROP INDEX "Screening_moviesId_key";

-- AlterTable
ALTER TABLE "Screening" DROP COLUMN "moviesId",
ADD COLUMN     "movieId" INTEGER NOT NULL,
ADD COLUMN     "screenId" INTEGER NOT NULL;

-- DropTable
DROP TABLE "Movies";

-- CreateTable
CREATE TABLE "Movie" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "runtimeMins" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Movie_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Screen" (
    "id" SERIAL NOT NULL,
    "number" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Screen_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Screening" ADD CONSTRAINT "Screening_movieId_fkey" FOREIGN KEY ("movieId") REFERENCES "Movie"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Screening" ADD CONSTRAINT "Screening_screenId_fkey" FOREIGN KEY ("screenId") REFERENCES "Screen"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
