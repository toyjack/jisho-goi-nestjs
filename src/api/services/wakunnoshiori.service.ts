import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { SearchWakunnosioriDto } from '../dto';

@Injectable()
export class WakunnoshioriService {
  constructor(private readonly prismaService: PrismaService) {}

  async search(query: SearchWakunnosioriDto) {
    const results = await this.prismaService.wakunnosiori_Entry.findMany({
      where: {
        AND: [
          {
            entry: {
              contains: query.entry,
            },
          },
          {
            definations: {
              some: {
                defination: {
                  contains: query.defination,
                },
              },
            },
          },
        ],
      },
      include: {
        definations: true,
      },
    });

    return results;
  }

  async findOne(id: string) {
    return await this.prismaService.wakunnosiori_Entry.findUnique({
      where: {
        id: Number(id),
      },
      include: {
        definations: true,
      },
    });
  }
}
