/*
window.addEventListener('DOMContentLoaded', (event) => {
	injectForumIFrame();
});
*/

function injectForumIFrame() {
	var theTitle = document.getElementsByTagName ("title")[0].textContent;
	var theBody = document.getElementsByTagName ("body")[0];
	var theDetails = document.createElement ("details");
	var theSummary = document.createElement ("summary");
	theSummary.innerHTML = "Discussions of this page";
	theDetails.appendChild(theSummary);
	theDetails.setAttribute ("class", "forumReveal");
	var theIFrame = document.createElement ("iframe");
	theDetails.appendChild(theIFrame);
	theIFrame.setAttribute ("class", "forumFrame");
	theIFrame.setAttribute ("src", "../../Forum/listForumByTitle.cgi?title="
							+ encodeURIComponent(theTitle)
							+ "&url="
							+ encodeURIComponent(window.location.href));
	theBody.appendChild (theDetails);
}