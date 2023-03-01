import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { SearchBunmeiDto } from '../dto';

@Injectable()
export class BunmeibonService {
  constructor(private readonly prismaService: PrismaService) {}

  async search(query: SearchBunmeiDto) {
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
            // gotou: {
            //   contains: query.gotou,
            // },
            // item_type: {
            //   contains: query.itemType,
            // },
            // bu: {
            //   contains: query.bu,
            // },
            // mon: {
            //   contains: query.mon,
            // },
            // page: {
            //   contains: query.page,
            // },
            // line: {
            //   contains: query.line,
            // },
          },
        ],
      },
    });
    return results;
  }

  async findOne(id: string) {
    return await this.prismaService.bunmeiSetsuyoshu.findUnique({
      where: {
        bunmei_id: id,
      },
    });
  }
}
