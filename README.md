***Texto original do desafio:***

**Catálogo de cervejas**

A ‘Cervejeiros SA’ está querendo inovar no mercado dos entusiastas de cervejas. Para isso, ficou decidido que a criação de uma aplicação mobile, que permita aos usuários consultarem informações sobre as cervejas existentes, é a melhor forma de se fazer isso.

Sua tarefa será criar um aplicativo para listar, com ou sem filtros, as cervejas do catálogo do ‘Cervejeiros SA’. A API a ser utilizada será a ‘PunkApi’, uma API 100% RESTful. Em outras palavras, os dados do catálogo serão providos por essa API. A representação do catálogo ficará a sua disposição.

Além da listagem deverá haver uma ‘tela’ com os detalhes da cerveja. Imagem, nome, descrição e ingredientes da cerveja deverão estar presentes nos detalhes da cerveja que for selecionada. Caso queira, pode-se acrescentar mais detalhes. Os itens selecionados poderão ser adicionados a uma lista de favoritos que, por sua vez, pode ser consultado a qualquer momento.

Bônus

Implementar infinite scroll na tela de consulta/busca/listagem (não é obrigatório). Utilizar o padrão de arquitetura de software MVP (Modal-View-Presenter).

Informações Adicionais

A API e sua documentação pode ser acessada neste endereço: https://punkapi.com/documentation/v2

Dúvidas

Em caso de dúvidas abra uma issue que assim que possível iremos responder e entrar em contato.

---

***O texto acima foi traduzido em requisitos do sistema  (alguns detalhes foram supostos):***

**Requisitos funcionais:**
- [ ] O usuário deve conseguir visualizar uma Lista de Cervejas do catálogo Cervejeiros SA, na qual cada elemento único contém informações de uma cerveja
- [ ] O usuário deve conseguir selecionar uma cerveja, na Lista de Cervejas, e visualizar em uma tela própria os Detalhes da Cerveja selecionada: imagem, nome, descrição, ingredientes; *outros itens poderão ser adicionados*
- [ ] O usuário deve conseguir visualizar uma Lista de Cervejas Favoritas
- [ ] O usuário deve conseguir adicionar uma cerveja na Lista de Cervejas Favoritas quando estiver visualizando os detalhes dessa cerveja
- [ ] O usuário deve conseguir deslizar a Lista de Cervejas para baixo, e assim visualizar mais cervejas disponíveis no catálogo online da Cervejeiros SA
- [ ] O usuário deve conseguir buscar por nome de cervejas, em todo o catálogo online da Cervejeiros SA
- [ ] O usuário deve conseguir filtrar cervejas na Lista de Cervejas do catálogo Cervejeiros SA; *parâmetros de filtro a definir*

**Requisitos não funcionais:**
- [ ] Arquitetura MVP (Model-View-Presenter)
- [ ] O usuário deve conseguir acessar a Lista de Cervejas Favoritas a qualquer momento
- [ ] Utilizar a API PunkAPI

---

**Nota:**
*Esse aplicativo foi desenvolvido como um desafio pessoal do autor deste repositório. Não há intenção em submter o código fonte, ou qualquer outra informação referente para a pessoa, ou empresa, que publicou o desafio inicial. Caso seja um candidato a vaga proposta, não copie ou reproduza diretamente o que foi feito neste repositório; sinta-se livre para estudar, realizar críticas e submenter mudanças, mas não use como referência.*
