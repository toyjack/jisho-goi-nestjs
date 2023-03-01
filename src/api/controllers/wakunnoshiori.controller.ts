import { Controller, Get, Param, Query } from '@nestjs/common';
import { WakunnoshioriService } from '../services';
import { SearchWakunnosioriDto } from '../dto';

@Controller('api/wakunnoshiori')
export class WakunnoshioriController {
  constructor(private readonly wakunnoshioriService: WakunnoshioriService) {}

  @Get('search')
  search(@Query() query: SearchWakunnosioriDto) {
    return this.wakunnoshioriService.search(query);
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.wakunnoshioriService.findOne(id);
  }
}
