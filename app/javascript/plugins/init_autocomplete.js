// app/javascript/plugins/init_autocomplete.js
import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('tiny_home_address');
  if (addressInput) {
    places({ container: addressInput });
  }
  // const homeAddressInput = document.getElementById('home_tiny_home_address');
  // if (homeAddressInput) {
  //   places({ container: homeAddressInput });
  // }
};

export { initAutocomplete };
