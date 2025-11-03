using DialogueManagerRuntime;
using Godot;
using System;

public partial class DialogController : Node {
    async public void QueueDialogue(Resource line, String id) {
        var nextLine = await DialogueManager.GetNextDialogueLine(line, "start");
        QueueDialogue(line, nextLine.NextId);
    }
}
