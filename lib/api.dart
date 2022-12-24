//fetch data from api and display it
//   }

  @override
		Widget build(BuildContext context) {
				return Scaffold(
						appBar: AppBar(
								title: Text('Quiz'),
						),
						body: FutureBuilder(
								future: _getQuiz(),
								builder: (BuildContext context, AsyncSnapshot snapshot) {
										if (snapshot.data == null) {
												return Container(
														child: Center(
																child: Text('Loading...'),
														),
												);
										} else {
												return ListView.builder(
														itemCount: snapshot.data.length,
														itemBuilder: (BuildContext context, int index) {
																return ListTile(
																		title: Text(snapshot.data[index].question),
																		subtitle: Text(snapshot.data[index].correctAnswer),
																);
														},
												);
										}
								},
						),
				);
		}
		