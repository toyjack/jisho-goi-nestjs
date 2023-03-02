import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { SearchRacvyoxvDto } from '../dto';

@Injectable()
export class RacyvoxvService {
  constructor(private readonly prismaService: PrismaService) {}

  async search(query: SearchRacvyoxvDto) {
    const results = await this.prismaService.racvyoxv.findMany({
      where: {
        AND: [
          {
            OR: [
              { kanji_pair: { contains: query.term } },
              { entry: { contains: query.term } },
              { ruby_left_first: { contains: query.term } },
              { ruby_left_remains: { contains: query.term } },
              { ruby_right_first: { contains: query.term } },
              { ruby_right_remains: { contains: query.term } },
            ],
          },

          {
            kanji_pair_length: query.kanji_pair_length,
          },

          {
            id: {
              lte: 656,
            },
          },

          // {
          //   nikkoku1_entry: {
          //     not: null,
          //   },
          // },
        ],
      },
    });
    return results;
  }

  async findOne(id: string) {
    return await this.prismaService.racvyoxv.findUnique({
      where: {
        id: Number(id),
      },
    });
  }
}
