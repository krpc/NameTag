using UnityEngine;

namespace NameTag
{
    // Note: name kept as KOSNameTag for backward compatibility
    public class KOSNameTag : PartModule
    {
        Window typingWindow;

        [KSPField (isPersistant = true, guiActive = true, guiActiveEditor = true, guiName = "Name Tag")]
        public string nameTag = "";

        [KSPEvent (guiActive = true, guiActiveEditor = true, guiName = "Change Name Tag")]
        public void PopupNameTagChanger ()
        {
            if (typingWindow != null)
                typingWindow.Close ();
            if (HighLogic.LoadedSceneIsEditor) {
                EditorFacility whichEditor = EditorLogic.fetch.ship.shipFacility;
                if (!(Career.CanTagInEditor (whichEditor))) {
                    var formattedString = string.Format ("The {0} requires an upgrade to assign name tags", whichEditor);
                    ScreenMessages.PostScreenMessage (formattedString, 6, ScreenMessageStyle.UPPER_CENTER);
                    return;
                }
            }
            var gObj = new GameObject ("nametag", typeof(Window));
            DontDestroyOnLoad (gObj);
            typingWindow = (Window)gObj.GetComponent (typeof(Window));
            typingWindow.Invoke (this, nameTag);
        }

        public void TypingDone (string newValue)
        {
            nameTag = newValue;
            TypingCancel ();
        }

        public void TypingCancel ()
        {
            typingWindow.Close ();
            typingWindow = null;
        }
    }
}
