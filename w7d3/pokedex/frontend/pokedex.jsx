import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';
import {configureStore} from './store/store';
import {fetchSinglePokemon} from './util/api_util';

document.addEventListener('DOMContentLoaded', () => {
  const rootEl = document.getElementById('root');
  const store = configureStore();
  window.fetchSinglePokemon = fetchSinglePokemon;
  window.store = store; 
  ReactDOM.render(<Root store={store} />, rootEl);
});
