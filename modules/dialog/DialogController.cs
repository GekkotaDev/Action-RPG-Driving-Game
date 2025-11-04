using DialogueManagerRuntime;
using DotNext.Collections.Generic;
using Godot;
using System;

public partial class DialogController : Node {
    async public void QueueDialogue(
            Resource dialog,
            string id,
            Action<DialogueLine>[] visitors
        ) {
        var response = await DialogueManager.GetNextDialogueLine(dialog, id);
        if (response?.NativeInstance == null) return;

        foreach (var callback in visitors) callback(response);
        QueueDialogue(dialog, response.NextId, visitors);
    }
}
