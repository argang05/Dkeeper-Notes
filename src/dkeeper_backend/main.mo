import Debug "mo:base/Debug";
import List "mo:base/List";
import Text "mo:base/Text";
actor DKeeper {
  //Creating A User Defined Datatype "Note":
  public type Note = {
    title : Text;
    content : Text;
  };
  //Creating Empty List of "Note" Type:
  stable var notes : List.List<Note> = List.nil<Note>();

  //Creating Function to Store Title and Content of Note:
  public func createNote(titleText : Text, contentText : Text) {

    let newNote : Note = {
      title = titleText;
      content = contentText;
    };

    notes := List.push(newNote, notes);
    // Debug.print(debug_show (notes));
  };

  public query func readNotes() : async [Note] {
    return List.toArray(notes);
  };

  public func removeNote(id : Nat) {
    let listFront = List.take(notes, id);
    let listBack = List.drop(notes, id + 1);
    notes := List.append(listFront, listBack);
  };

};
