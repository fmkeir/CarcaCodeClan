<template lang="html">
  <div class="main">
    <h1> CarcaCodeClan </h1>
    <board :boardState="boardState"/>
  </div>
</template>

<script>
import Board from './components/Board.vue'

export default {
  name: "app",
  data(){
    return {
      boardState: Array(121).fill("")
    }
  },
  components: {
    'board': Board
  }
}
</script>

<style lang="css" scoped>

</style>
