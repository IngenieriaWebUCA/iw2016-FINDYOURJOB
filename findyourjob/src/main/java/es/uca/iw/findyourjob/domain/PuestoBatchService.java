package es.uca.iw.findyourjob.domain;
import org.gvnix.addon.jpa.annotations.batch.GvNIXJpaBatch;
import org.springframework.stereotype.Service;

@Service
@GvNIXJpaBatch(entity = Puesto.class)
public class PuestoBatchService {
}
