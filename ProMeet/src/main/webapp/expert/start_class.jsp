<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>

<head>
 <%@include file="/common_html/all_css.html"%>

      
    <link href="https://fonts.googleapis.com/css2?family=Urbanist:wght@400;600;700&display=swap" rel="stylesheet">

    <style>
        #root {
            width: 100vw;
            height: 100vh;
            }
    </style>
</head>


<body>

  <%String cid=(String)request.getAttribute("classId"); %>
    <div id="root"></div>
    <button class="btn btn-danger"><a href="/ProMeet/StopClass?clId=<%=cid%>">Stop Class</a></button>
    
    
  
</body>
<script src="https://unpkg.com/@zegocloud/zego-uikit-prebuilt/zego-uikit-prebuilt.js"></script>
<script>
window.onload = function () {
    function getUrlParams(url) {
        let urlStr = url.split('?')[1];
        const urlSearchParams = new URLSearchParams(urlStr);
        const result = Object.fromEntries(urlSearchParams.entries());
        return result;
    }


        // Generate a Token by calling a method.
        // @param 1: appID
        // @param 2: serverSecret
        // @param 3: Room ID
        // @param 4: User ID
        // @param 5: Username
    const roomID = getUrlParams(window.location.href)['roomID'] ||"<%=cid%>";
    const userID = Math.floor(Math.random() * 10000) + "";
    const userName = "userName" + userID;
    const appID = 293772691;
    const serverSecret = "edfca8c4aaa6ca2867a9ba112c61ef2e";
    const kitToken = ZegoUIKitPrebuilt.generateKitTokenForTest(appID, serverSecret, roomID, userID, userName);

    
        const zp = ZegoUIKitPrebuilt.create(kitToken);
        zp.joinRoom({
            container: document.querySelector("#root"),
            sharedLinks: [{
                name: 'Personal link',
                url: window.location.protocol + '//' + window.location.host  + window.location.pathname + '?roomID=' + roomID,
            }],
            scenario: {
                mode: ZegoUIKitPrebuilt.VideoConference,
            },
                
           	turnOnMicrophoneWhenJoining: true,
           	turnOnCameraWhenJoining: true,
           	showMyCameraToggleButton: true,
           	showMyMicrophoneToggleButton: true,
           	showAudioVideoSettingsButton: true,
           	showScreenSharingButton: true,
           	showTextChat: true,
           	showUserList: true,
           	maxUsers: 50,
           	layout: "Sidebar",
           	showLayoutButton: true,
         
            });
}
</script>

</html>