GREEN="\033[1;32m"
YELLOW="\033[1;33m"
CYAN="\033[1;36m"
RED="\033[1;31m"
RESET="\033[0m"

echo -e "${CYAN}>>> Atualizar repositórios e instalar dependências (Debian 12)${RESET}"
echo -e "${YELLOW}sudo apt update && sudo apt install -y curl wget bash${RESET}"
echo
echo -e "${CYAN}>>> Baixar script (substitua URL)${RESET}"
echo -e "${GREEN}curl -L -o install.sh \"<URL_DO_SCRIPT>\"${RESET}"
echo -e "${GREEN}wget -O install.sh \"<URL_DO_SCRIPT>\"${RESET}"
echo
echo -e "${CYAN}>>> Verificar conteúdo (opcional)${RESET}"
echo -e "${YELLOW}less install.sh${RESET}"
echo
echo -e "${CYAN}>>> Tornar executável e rodar${RESET}"
echo -e "${GREEN}chmod +x install.sh && sudo ./install.sh${RESET}"
echo
echo -e "${RED}>>> AVISO:${RESET} sempre revisar o script antes de executá-lo!"
