/*
  _buildScrollingText() {
    return FutureBuilder(
        future: XmlFetchService.fetchNoteXml(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            News news = snapshot.data;
            return Padding(
              padding:
                  EdgeInsets.only(top: 20.0, left: 20, right: 20, bottom: 10),
              child: Material(
                elevation: 3,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                      image: AssetImage("assets/legno.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, bottom: 20, left: 10, right: 10),
                    child: Center(
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black87,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.cyan,
                                  blurRadius: 6.0,
                                  spreadRadius: 0.0,
                                  offset: Offset(
                                    0.0,
                                    3.0,
                                  ),
                                ),
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Marquee(
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.02,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                              text: news.note.first.toUpperCase())),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Container(
              color: Colors.transparent,
            );
          }
        });
  } */