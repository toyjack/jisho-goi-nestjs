import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { SearchJiruishoDto } from '../dto';

@Injectable()
export class JiruishoService {
  constructor(private readonly prismaService: PrismaService) {}

  async search(query: SearchJiruishoDto) {
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

    return results;
  }

  async findOne(id: string) {
    return await this.prismaService.jiruisho.findUnique({
      where: {
        id: Number(id),
      },
    });
  }
}
