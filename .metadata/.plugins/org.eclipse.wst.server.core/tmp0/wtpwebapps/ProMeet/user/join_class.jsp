<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html>

<head>
 <%@include file="/common_html/all_css.html"%>

      
    <link href="https://fonts.googleapis.com/css2?family=Urbanist:wght@400;600;700&display=swap" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <style>
        #root {
            width: 100vw;
            height: 100vh;
            }
    </style>
</head>


<body>
    <div id="root"></div>
    
    
    <%String cid=(String)request.getAttribute("userClassId"); %>
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


<script>

function moveToHome(){

	window.location.href="/ProMeet/user/expert_response.jsp"
	}
const cid = "<%= cid %>"; // Get cid from JSP variable

function checkStatusFromServlet() {
    $.ajax({
        url: '/ProMeet/CheckClassStatus?cid=' + cid,
        type: 'GET',
        success: function(response) {
            const result =  response.trim().toLowerCase();
            console.log(typeof result);

            if (result=="true") {
                console.log("Status: true");
                // Add any logic here when status is true
               
            } else {
                console.log("Status: false");
                clearInterval(x)
                alert("Meeting will be Ended in 10 seconds")
                setTimeout(moveToHome,10000)
            }
        },
        error: function(xhr, status, error) {
            console.error("Error calling servlet:", error);
        }
    });
}
let x=setInterval(checkStatusFromServlet, 5000);


</script>

</html>