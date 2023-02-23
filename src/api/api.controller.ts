import { Controller, Get, Query } from '@nestjs/common';
import { ApiService } from './api.service';
import { SearchDto } from './dto';

@Controller('api')
export class ApiController {
  constructor(private readonly apiService: ApiService) {}

  @Get('search')
  search(@Query() query: SearchDto) {
    return this.apiService.search(query);
  }
}
