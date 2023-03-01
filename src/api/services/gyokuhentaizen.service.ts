import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { SearchGyokuhenDto } from '../dto';

@Injectable()
export class GyokuhentaizenService {
  constructor(private readonly prismaService: PrismaService) {}

  async search(query: SearchGyokuhenDto) {
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

  async findOne(id: string) {
    return await this.prismaService.gyokuhentaizen.findUnique({
      where: {
        ghtz_id: id,
      },
    });
  }
}
