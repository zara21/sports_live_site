fetch('/sports_live_site/api/get_notifications.php')
    .then(response => response.json())
    .then(data => {
        if (data.status === 'success') {
            const notificationsList = document.getElementById('notifications-list');
            notificationsList.innerHTML = ''; // არსებული ნოთიფიკაციების გასუფთავება

            data.notifications.forEach(notification => {
                const listItem = document.createElement('li');
                listItem.className = `list-group-item d-flex justify-content-between align-items-center ${notification.is_read === 0 ? 'notification-unread' : 'notification-read'}`;
                listItem.innerHTML = `
                    <span>${notification.message}</span>
                    <small class="text-muted">${new Date(notification.created_at).toLocaleString()}</small>
                `;
                notificationsList.appendChild(listItem);
            });

            // განაახლე უნახავი ნოთიფიკაციების რაოდენობა
            document.getElementById('notification-count').textContent = data.notifications.filter(n => n.is_read === 0).length;
        } else {
            console.error(data.message);
        }
    })
    .catch(error => console.error('Error:', error));
