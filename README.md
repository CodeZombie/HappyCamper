# Happy Camper
A Bandcamp API interface written in Dart.

## Features

* Easily search bandcamp for information, find albums from tags, search for new tags.
* API results are automatically cached, removing any unecessary network requests.

## Getting started

Use the following command to generate the Hive Adapters for the models:
`flutter packages pub run build_runner build --delete-conflicting-outputs`


## TODO:
//isar gets initialized outside of the HapperCamper module.
Isar database = Isar.open([relatedtagsschema]);

tags = await RelatedTags.get(database, "rock");

class RelatedTags(){
    Id id;
    String searchTerm;
    List<String> tags;

    RelatedTags(Isar database, String searchTerm){
        id = hash(searchTerm);
        database.relatedtags.get()
    }

    static Future<RelatedTags> get(Isar database, String searchTerm) async {
        relatedTagObject = await database.relatedtags.get(id: hash(searchTerm));
        if (relatedTagObject is not null){
            return relatedTagObject
        }

        //do the whole web scraping thing :D
        //Store the scraped object to the isar database.
        //return the object.
    }
}