import net.dv8tion.jda.api.JDA;
import net.dv8tion.jda.api.JDABuilder;
import net.dv8tion.jda.api.entities.Activity;
import net.dv8tion.jda.api.events.message.MessageReceivedEvent;
import net.dv8tion.jda.api.hooks.ListenerAdapter;


import javax.security.auth.login.LoginException;

public class Bot extends ListenerAdapter {
    public static void main(String[] args) throws LoginException {
        JDA jda = JDABuilder.createDefault("OTEwNjc0NjQwODUzMTQ3NjQ5.YZWR2Q.9eWCmNp1fG11vBcifdWBw_Xj8ew")
                .addEventListeners(new Bot())
                .setActivity(Activity.playing("ATM DB"))
                .build();
    }


    @Override
    public void onMessageReceived(MessageReceivedEvent e) {
        System.out.println("We received a message from "
                + e.getAuthor().getName() + ": "
                + e.getMessage().getContentDisplay());

        if(e.getMessage().getContentRaw().equals("/ping")) {
            e.getChannel().sendMessage("PONG").queue();
        }
    }

}
