class PaginationQuery {
  final int offset;
  final int limit;

  PaginationQuery({this.offset = 1, this.limit = 10});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'offset': offset, 'limit': limit};
  }
}
