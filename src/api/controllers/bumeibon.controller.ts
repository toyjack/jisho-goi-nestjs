import { Controller, Get, Param, Query } from '@nestjs/common';
import { BunmeibonService } from '../services';
import { SearchBunmeiDto } from '../dto';

@Controller('api/bunmeibon')
export class BunmeibonController {
  constructor(private readonly bunmeibonService: BunmeibonService) {}

  @Get('search')
  search(@Query() query: SearchBunmeiDto) {
    return this.bunmeibonService.search(query);
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.bunmeibonService.findOne(id);
  }
}
