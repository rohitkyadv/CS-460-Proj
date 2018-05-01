/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


function saveFriends(senderid, reciverId) {
    with (document) {

        var url = 'savefriends?senderid=' + senderid + '&reciverId=' + reciverId;
      //  alert(url);
        if (window.XMLHttpRequest)
        {
            req3 = new XMLHttpRequest();
        }
        else if (window.ActiveXObject)
        {
            try
            {
                req3 = new ActiveXObject("Msxml2.XMLHTTP");
            }
            catch (e)
            {
                req3 = new ActiveXObject("Microsoft.XMLHTTP" + e);
            }
        }
        req3.open("POST", url, true);
        req3.onreadystatechange = searchPolicyNameByCmpNamedisplay;
        req3.send(null);

    }
}

function searchPolicyNameByCmpNamedisplay() {
    if (req3.readyState == 4)
    {
        var strData = req3.responseText;
     //   alert(strData);
        document.getElementById("polcName").innerHTML = "";
        document.getElementById("polcName").innerHTML = strData;

    }
}


function saveSharePost(postid) {
    with (document) {
        
        var s = 'postid' + postid;
        
        var po = getElementById(s).value;
        
        var s1 = 'registrationid' + postid;
        var recvid = getElementById(s1).value;
        var s2 = 'description' + postid;
        var description = getElementById(s2).value;
        

        var url = 'sharepost?postid=' + po + '&registrationid=' + recvid + '&description=' + description;

        if (window.XMLHttpRequest)
        {
            req3 = new XMLHttpRequest();
        }
        else if (window.ActiveXObject)
        {
            try
            {
                req3 = new ActiveXObject("Msxml2.XMLHTTP");
            }
            catch (e)
            {
                req3 = new ActiveXObject("Microsoft.XMLHTTP" + e);
            }
        }
        req3.open("POST", url, true);
        req3.onreadystatechange = document.getElementById(postid).style.display = 'none';
        req3.send(null);

    }
}
