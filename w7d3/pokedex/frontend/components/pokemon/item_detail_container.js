import ItemDetail from './item_detail';
import {connect} from 'react-redux';
import { selectPokemonItem } from '../../reducers/selectors';

const mapStateToProps = (state, { params }) => ({
  item: selectPokemonItem(state, parseInt(params.itemId))
});



export default connect(
  mapStateToProps
)(ItemDetail);
