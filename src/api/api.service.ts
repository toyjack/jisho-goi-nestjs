import { Injectable } from '@nestjs/common';
import { NotFoundException } from '@nestjs/common/exceptions';
import { PrismaService } from 'src/prisma/prisma.service';
import { SearchDto } from './dto';

@Injectable()
export class ApiService {
  constructor(private readonly prismaService: PrismaService) {}

  async search(query: SearchDto) {
    if (query.database === 'gyokuhentaizen') {
      const results = await this.prismaService.gyokuhentaizen.findMany({
        where: {
          AND: [
            {
              entry: {
                contains: query.entry,
              },
              OR: [
                {
                  jion_r: {
                    contains: query.jion,
                  },
                },
                {
                  jion_l: {
                    contains: query.jion,
                  },
                },
              ],
              wakun: {
                contains: query.wakun,
              },

              ...(query.radical ? { radical: query.radical } : {}),
              ...(query.remain_strokes
                ? { remain_strokes: query.remain_strokes }
                : {}),

              ghtz_id: {
                startsWith: query.id,
              },
            },
          ],
        },
      });
      return results;
    }

    throw new NotFoundException('Database not found.');
  }
}
