// NUI Communication para atualizar HUD
window.addEventListener('message', function(event) {
    const data = event.data;

    if (data.type === 'updateBalloonHUD') {
        const hud = document.getElementById('balloonHUD');
        
        if (data.active) {
            hud.classList.add('active');
            document.getElementById('altitude').textContent = Math.floor(data.altitude) + 'm';
            
            const healthPercent = Math.floor((data.health / 1000) * 100);
            const healthElement = document.getElementById('health');
            healthElement.textContent = healthPercent + '%';
            
            // Mudar cor baseado na saúde
            if (healthPercent > 75) {
                healthElement.style.color = '#00FF00';
            } else if (healthPercent > 50) {
                healthElement.style.color = '#FFFF00';
            } else if (healthPercent > 25) {
                healthElement.style.color = '#FF6600';
            } else {
                healthElement.style.color = '#FF0000';
            }
        } else {
            hud.classList.remove('active');
        }
    }
});
