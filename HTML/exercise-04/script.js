const user = {
  name: "Piyush Sharma",
  designation: "Senior Software Engineer",
  company: "Infuse Consulting",
  hobbies: ["Reading", "Listening to music", "Collecting stamps"],
};

/**
 * Use destructuting to log the following
 *
 */

const printUserProfile = ({ name, designation, hobbies } = user) => {
  // Piyush Sharma is a Senior Software Engineer at Infuse Consulting. He likes Reading, Listening to music and Collecting stamps
  console.log(`${name} is a ${designation} at Infuse Consulting. He likes  ${get_hobby_list(hobbies)}`);
};

printUserProfile();

function get_hobby_list(hobbies) {
  hobbies_str = "";
  if (hobbies.length == 0) return "";
  else if (hobbies.length == 1) return hobbies[0];
  else {
    hobbies.forEach((hobby, index) => {
      if (index == hobbies.length - 1) {
        hobbies_str += `and ${hobby} `;
        return;
      }
      hobbies_str += `${hobby}, `;
    });
  }
  return hobbies_str;
}
