import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import {
  SearchGyokuhenDto,
  SearchBunmeiDto,
  SearchJiruishoDto,
  SearchRacvyoxvDto,
  SearchWakunnosioriDto,
} from './dto';

@Injectable()
export class ApiService {
  constructor(private readonly prismaService: PrismaService) {}

  async searchGyokuhen(query: SearchGyokuhenDto) {
    // return { query };
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

  async searchRacvyoxv(query: SearchRacvyoxvDto) {
    const results = await this.prismaService.racvyoxv.findMany({
      where: {
        AND: [
          {
            OR: [
              { kanji_pair: { contains: query.term } },
              { ruby_left_first: { contains: query.term } },
              { ruby_left_remains: { contains: query.term } },
              { ruby_right_first: { contains: query.term } },
              { ruby_right_remains: { contains: query.term } },
            ],
          },

          {
            kanji_pair_length: query.kanji_pair_length,
          },
        ],
      },
    });
    return results;
  }

  async searchBunmei(query: SearchBunmeiDto) {
    const results = await this.prismaService.bunmeiSetsuyoshu.findMany({
      where: {
        AND: [
          {
            entry: {
              contains: query.entry,
            },
            gokei: {
              contains: query.gokei,
            },
            shouten: {
              contains: query.shouten,
            },
            left_kun: {
              contains: query.leftWakun,
            },
            defination: {
              contains: query.def,
            },
            gotou: {
              contains: query.gotou,
            },
            item_type: {
              contains: query.itemType,
            },
            bu: {
              contains: query.bu,
            },
            mon: {
              contains: query.mon,
            },
            page: {
              contains: query.page,
            },
            line: {
              contains: query.line,
            },
          },
        ],
      },
    });
    return results;
  }

  async searchWakunnosiori(query: SearchWakunnosioriDto) {
    const results = await this.prismaService.wakunnosiori_Entry.findMany({
      where: {
        entry: {
          contains: query.entry,
        },
      },
      include: {
        definations: {
          where: {
            defination: {
              contains: query.defination,
            },
          },
          orderBy: {
            index: 'asc',
          },
        },
      },
    });

    return results;
  }

  async searchJiruisho(query: SearchJiruishoDto) {
    const results = await this.prismaService.jiruisho.findMany({
      where: {
        AND: [
          {
            entry: {
              contains: query.entry,
            },
            hen: {
              contains: query.hen,
            },
            bu: {
              contains: query.bu,
            },
            onkun: {
              contains: query.onkun,
            },
            char_count: {
              contains: query.char_count,
            },
            gokei_search_original: {
              contains: query.gokei_search_original,
            },
            gokei_search_current: {
              contains: query.gokei_search_current,
            },
            defination: {
              contains: query.defination,
            },
          },
        ],
      },
    });
    // return query;
    return results;
  }

  async bunmeiFindOne(id: string) {
    return this.prismaService.bunmeiSetsuyoshu.findUnique({
      where: {
        bunmei_id: id,
      },
    });
  }

  async jiruishoFindOne(id: number) {
    return this.prismaService.jiruisho.findUnique({
      where: {
        id: id,
      },
    });
  }

  gyokuhenFindOne(id: string) {
    return this.prismaService.gyokuhentaizen.findUnique({
      where: {
        ghtz_id: id,
      },
    });
  }

  racvyoxvFindOne(id: number) {
    return this.prismaService.racvyoxv.findUnique({
      where: {
        id: id,
      },
    });
  }

  wakunnosioriFindOne(id: number) {
    return this.prismaService.wakunnosiori_Entry.findUnique({
      where: {
        id: id,
      },
      include: {
        definations: true,
      },
    });
  }
}
